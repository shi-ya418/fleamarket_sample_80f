class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show, :destroy, :purchase, :buy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_card, only: [:purchase, :buy]

  def index
    @products = Product.all
    @images = Image.all
  end

  def new
    @product = Product.new
    @images = @product.images.build
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to items_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @images = @product.images
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
      render :delete unless @product.user_id == current_user.id && @product.destroy
      redirect_to root_path
  end

  def purchase
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
    # すでにクレジットカードが登録しているか？
    if @card.present?
      # 登録している場合,PAY.JPからカード情報を取得する
      # PAY.JPの秘密鍵をセットする。
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      # PAY.JPから顧客情報を取得する。
      customer = Payjp::Customer.retrieve(@card.payjp_id)
      # PAY.JPの顧客情報から、デフォルトで使うクレジットカードを取得する。
      @card_info = customer.cards.retrieve(customer.default_card)
      # クレジットカード情報から表示させたい情報を定義する。
      # クレジットカードの画像を表示するために、カード会社を取得
      @card_brand = @card_info.brand
      # クレジットカードの有効期限を取得
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2, 3)
    end
  end

  def buy
    # すでに購入されていないか？
    if @product.status.blank?
      redirect_back(fallback_location: root_path)
    elsif @card.blank?
      # カード情報がなければ、買えないから戻す
      redirect_to action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      # 購入者もいないし、クレジットカードもあるし、決済処理に移行
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      # 請求を発行
      Payjp::Charge.create(
        amount: @product.price,
        customer: @card.payjp_id,
        currency: 'jpy'
      )
    end
    # 売り切れなので、productの情報をアップデートして売り切れにする画面
    if @product.update(status: "売り切れ")
      flash[:notice] = '購入しました。'
      redirect_to root_path
    else
      flash[:alert] = '購入に失敗しました。'
      redirect_to action: 'show', id: @product.id
        end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_explanation, :brand, :product_status_id, :shipping_method_id, :shipping_charge_id, :prefecture_id, :days_until_shipping_id, :price, :status, images_attributes: [:src, :src_cache, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
