# 
## 概要
テックキャンプの最終課題にて作成したアプリケーションを紹介します。また、自身で実装した箇所、および開発を通じて得られた経験についても紹介します。

## アプリケーション情報
### アプリケーション概要
フリーマーケットのアプリケーションを作成しました。
### 接続先情報
URL http://54.248.208.64/  
ID/Pass  
ID: 80teamf  
Pass: 80teamf  
テスト用アカウント等  
購入者用  
メールアドレス: buyer1@gmail.com  
パスワード: 11111111  
購入用カード情報  
番号： 4242424242424242  
期限： 20/12  
セキュリティコード：123  
出品者用  
メールアドレス名: seller1@gmail.com  
パスワード: 11111111  
Githubリポジトリ  
https://github.com/shi-ya418/fleamarket_sample_80f  

## 開発状況
### 開発環境
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code  
開発期間と平均作業時間  
開発期間：8/4~8/28(25日間)  
1日あたりの平均作業時間：9時間  
開発体制  
人数：5人  
アジャイル型開発（スクラム）  
Trelloによるタスク管理  
### 動作確認方法
Chromeの最新版を利用してアクセスしてください。  
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続ください。  
接続先およびログイン情報については、上記の通りです。  
同時に複数の方がログインしている場合に、ログインできない可能性がございます。  
テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品  
確認後、ログアウト処理をお願いします。  

## デモ画像
### トップページ
![トップページ](readme_images/top_page.mov)

## 担当箇所一覧と確認方法
### 本番環境へのデプロイ（バックエンド）
### 商品出品機能（バックエンド）
出品用アカウントでログイン後、トップページ右下に表示のある出品ボタンから適当な画像で作業を行うと確認できます
### 商品編集機能（バックエンド）
商品出品後の商品詳細ページより商品編集ボタンより、行うことができます。
### ログイン、ユーザー新規作成ページのマークアップ（フロントエンド）
ヘッダーのログアウトボタンからログアウト後、ログインまたは、新規登録へ進み、適当な情報を入力していただけると確認できます。
### パンクズ機能（バックエンド）
トップページ以外には、パンクズリストがヘーダーの下部に表示されるので確認できます。
### 商品検索機能（フロント、バックエンド）
トップページのヘッダー内の検索バーより適当なキーワードで検索していただけると確認できます。
### フラッシュメッセージの表示（フロント、バックエンド）
商品出品、商品編集等を行っていただくとヘッダー上部にメッセージが表示されます。
### バリデートエラーの際のエラー分の翻訳とマークアップ（フロント、バックエンド）
商品出品時やユーザー登録時に入力欄を空で送信されるとエラー文が確認できます。
### 売り切れの商品にsoudoutの表示が出るようにマークアップ（フロントエンド）
購入者アカウントにてログイン後、トップページ下部の商品一覧より商品詳細ページ、商品詳細ページの購入ボタンで購入確認ページ、購入ボタンを押して購入後、詳細ヘージへ遷移するので、詳細ページにて確認ください。トップページの商品一覧にも反映されます。

## 各担当箇所の詳細
### 本番環境へのデプロイ（バックエンド）
#### 概要
アプリケーションをEC2のサーバにデプロイし、全世界に公開状態にする。
#### 担当内容
AWSを使っての本番環境へのデプロイ
S3への画像保存の設定
Encrypted Credentialsを使ってアクセスキー等の設定
basic認証の設定
### 商品出品機能
#### 概要
商品を出品することができるようにする。
#### 担当内容
画像の複数枚投稿
画像のプレビュー表示
画像の差し替え
削除、編集ボタンの実装
activehashを使ってのプルダウンリストの作成
### 商品編集機能
#### 概要
商品の情報を編集することができるようにする。
商品情報を編集できるのは、商品を投稿したユーザーだけである。
#### 担当内容
投稿内容の編集
画像のプレビュー表示
画像の差し替え
削除、編集ボタンの実装
投稿者のみ編集可能　
### ログイン、ユーザー新規作成ページのマークアップ
#### 概要
ユーザー新規登録/ログインページのコーディングを行う。
#### 担当内容
ログインページ、ユーザー新規作成ページのマークアップ
### パンくず機能
#### 概要
パンくず機能を実装する。
#### 担当内容
各ページにパンクズリストが表示されるようにヘッダー下部へ設置
### 商品検索機能
#### 概要
トップページの上部から、商品をキーワード検索することができる。
#### 担当内容
トップページ上部の検索バーよりキーワード検索を実装
検索結果ページの作成とマークアップ
### バリデーションエラーの際のエラー文の翻訳とマークアップ（フロント、バックエンド）
#### 概要
バリデーションによるエラーの際のエラー文を英語から日本語へ翻訳
エラー文をわかりやすいように表示
#### 担当内容
バリデーションエラーが起きた際のエラー文表示のマークアップ
エラーのある箇所の入力フォームを赤字でわかりやすいように変更
### 売り切れの商品がわかるようにマークアップ（フロントエンド）
#### 概要
売り切れ商品にSOLDOUTの表示が出るように実装
#### 担当内容
売り切れ商品にSOLDOUTが出るようにマークアップ
トップページの商品一覧と商品詳細ページに実装
## 開発を通じて得られた知見
### 工夫した点
#### ①チームとして工夫を行った点
　チームとして工夫を行った点は3点あります。1点目は、LINEで常時通話状態にしたこと、2点目は、エラーの共有をすること、3点目は、1日3回のショートミーティングです。
1点目のLINEで常時通話状態にしたことは、コロナの影響でほとんどリモートでのチーム開発となったので行いました。チーム内でコミュニケーションを取りやすいように、常時LINEを繋ぎ会話が可能な状態で開発を行いました。併せて、集中したい際は自由退出できるようにしました。
　2点目のエラーの共有は、チームの皆が未経験であることから、つまずく箇所が類似するため、事前エラーを共有することで開発のスピードが上がると考えました。また、自分が担当していない機能の知識も、身に付けることが出来ました。
　3点目の1日3回のショートミーティングでは、その日のタスクや現在詰まっていること、進捗確認等の、各自の開発状況をチームで共有しました。結果、余裕のある人が詰まっている人を助けることが出来たり、お互いの開発スピードが分かったことや、各々がより責任感を持つことで、開発のスピードが上がったと考えています。
#### ②個人として工夫を行った点
　個人で工夫したことは2点あります。1点目は、チーム内に情報をアウトプットや共有を行うこと、2点目は、コードをわかりやすく簡潔に記述することです。
　1点目は、自分が調べていて役に立った記事や情報は、チーム内に共有するようにしました。他の人が実装している機能は当事者以外ではできないので、少しでも理解し合えるよう共有やアウトプットを行いました。そうすることで、自分自身の理解度も増しました。
　2点目は、コードをわかりやすく簡潔に書くことです。わかりやすいクラス名や部分テンプレート、同じクラス名を使うことで、CSSの記述を減らす等の工夫を行いました。また、カリキュラムで取り扱いのないところは、コメントアウトで説明を残すことで、チームメイトがわかりやすいようにしました。
### 苦労した点
#### ①チームとして苦労した点
　チームとして苦労したことは、2点あります。1点目は、コンフリクトのエラー、2点目は、クラス名の設定です。
　1点目は、コンフリクトを解消する際に、必要なコードの消失やコードが重複等がありました。結果、masterブランチで確認する際に、エラーが発生し原因を突き止めるのに時間がかかりました。
　2点目は、クラス名がすでに使われていたり、後からクラス名が使われていたことによって意図しないCSSが効いてしまうことです。あとからビューが崩れてしまっていることもありました。
#### ②個人として苦労した点
　個人として苦労したことは、本番環境へのデプロイです。ローカル環境では問題なく動いていたり、問題ないコードでも本番環境ではエラーになることもありました。また、自身で記述したコードであればすぐに問題点を発見できるのですが、他者が書いたコードであると使ったことがないGemの使用により、問題点を見つけるのに時間がかかることがありました。デプロイを担当することで、全てのコードを一通り見ることができ、他のチーム員よりも幅広く学ぶことができたと考えています。

## DB設計
### addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null:false|
|prefecture|string|null: false|
|city|string|null:false|
|house_number|string|null:false|
|number_sign_etc|string||
|phone_number|integer||
|user_id|integer|null: false, foreign_key|
#### Association
- belongs_to :user

### usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false|
|password|string|null: false, unique: true, minimum: 7|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null:false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday_y_m_d|string|null: false|
#### Association
- has_many :addresses
- has_many :favorites
- has_many :products
- has_many :comments
- has_many :credit_cards

### cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false foreign_key: true|
|payjp_id|string||
#### Association
- belongs_to :user

### favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
#### Association
- belongs_to :user
- belongs_to :product

### productsテーブル
|Column|Type|Options|
|------|----|-------|
|product_name|string|null: false|
|product_explanation|string|null: false|
|brand|string||
|product_status_id|string|null:false|
|shipping_method_id|string|null: false|
|shipping_charge_id|string|null: false|
|shipping_area_id|string|null: false|
|days_until_shipping_id|string|null:false|
|price|integer|null: false|
|status|string|null: false|
|user_id|integer|null:false, foreign_key: true|
#### Association
- belongs_to :user
- has_many :favorites
- belongs_to :category
- has_many :images
- has_many :comments

### imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string||
|product_id|integer|null: false, foreign_key: true|
#### Association
- belongs_to :product

### commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
#### Association
- belongs_to :product
- belongs_to :user

### categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
#### Association
- has_many :products
