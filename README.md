## アプリケーション名

### **Rem(レム)**

## アプリケーション概要

分譲マンション管理組合のサポートをするためのアプリです。マンション、区分所有者、社員等のデータ管理が可能です。

## アップデート情報

2023/11/05  
区分所有者相談機能及びコメント機能を実装しました。  
これにより、区分所有者は管理会社にチャット形式で問い合わせできます。  
管理会社とその区分所有者は、いつでも履歴を確認できるようになります。

2023/11/10  
相談機能及びコメント機能に対する通知機能を実装しました。

2023/11/18  
書類アップロード機能(pdf)を実装しました。

2023/11/26  
駐車場、駐輪場、バイク置き場の区画情報を管理する機能を実装しました。

2023/11/29  
区画契約情報管理機能を実装しました。

## URL

[https://rem-6zkh.onrender.com/](https://rem-6zkh.onrender.com/)

## ベーシック認証

ID：admin  
PASS：2222

## デモデータについて

- 管理会社アカウント 5 個  
  (詳細はテスト用アカウント一覧参照)
- 区分所有者アカウント 52 個  
  (詳細はテスト用アカウント一覧参照)
- マンションデータ 5 棟
- 問い合わせデータ  
  後述するおすすめアカウントで確認できます。
- 書類データ…マンション「サンコート」から閲覧できます。  
   マンションサンコートに登録してあります。  
   後述するおすすめアカウントから閲覧できます
- 駐車場などの区画情報及び契約情報  
  管理会社 employee から閲覧できます。

## 閲覧時におすすめのアカウント

以下のアカウントには、初期データとして相談、それに伴う通知、マンション書類データ等を入れてあります。  
マンションの書類データは、以下の管理会社アカウントからマンション「サンコート」を選択したあと書類アイコンを押してください。
デモデータとして、マンション書類を入れてあるのは「サンコート」のみです。

#### 管理会社(employee)

- email: qqq@example.com
- password: 111qqq

#### 区分所有者(マンション名:サンコート)

- email: a01@example.com
- password: 1a1a1a

## 簡単な使い方

- 管理会社 employee を使用する場合  
  ログインしたら最初に右上のプルダウンメニューになっている担当物件からマンションを選択してください。  
  画面左上に選択したマンション名が出ていればそのマンションの情報トップページにアクセスしている状態です。そこから好きなマンション情報にアクセスしてください。

- マンション区分所有者を使用する場合  
  ログインしたらそのユーザーの居住するマンション情報や管理会社への問い合わせができます。

## テスト用アカウント一覧

### ---管理会社---

#### admin

マンション、社員、区分所有者等の登録を含めた全ての操作が可能です。

- email: fff@example.com
- password: fff444

#### manage

社員の登録以外の操作が可能なアカウントです。役職者やデータ操作をさせる専門部署などに割り当てます。

- email: jjj@example.com
- password: 444fff

#### employee

基本的に閲覧のみが可能なアカウントです。マンションの担当者であるフロント(営業)はこちらのアカウントを使用します。

- email: qqq@example.com
- password: 111qqq

- email: www@example.com
- password: 222www

- email: eee@example.com
- password: 333eee

### ---区分所有者---

email はマンション毎にアルファベットの a~e まで割り振ってます。その後に続く数字で戸数分生成しています。  
パスワードは全てのユーザーが以下の内容に設定しています。

- password: 1a1a1a

#### マンション名:サンコート

- email: a01@example.com  
  a01~a12 まで

#### マンション名:モダンパーク

- email: b01@example.com  
  b01~b10 まで

#### マンション名:サンライズヒルズ

- email: c01@example.com  
  c01~c09 まで

#### マンション名:グリーンコート

- email: d01@example.com  
  d01~d11 まで

#### マンション名:アーバンパレス

- email: e01@example.com  
  e01~e10 まで

## 機能

- マンション登録データの登録、一覧表示、詳細表示
- 区分所有者データの登録、一覧表示
- 社員データの登録
- 区分所有者の相談機能(画像添付可)&コメント機能、それに対する通知機能
- 社員ごとの権限管理
- 管理者画面でのデータ一括管理
- ユーザーやマンションデータの CSV 出力
- マンション書類の登録(PDF)、閲覧、ダウンロード
- マンションに存在する駐車場、駐輪場、バイク置き場の区画情報の閲覧

## 利用方法

### 管理会社側

1. 権限のあるユーザーが社員ユーザーを登録します。
2. 権限のあるユーザーがマンションをデータ登録します。
3. 権限のあるユーザーがマンションの区分所有者を登録します。
4. 社員ユーザーでログインして担当のマンションの情報や区分所有者のデータを表示できます。
5. 担当マンションの区分所有者からの問い合わせに対して返信できます。
6. マンションの書類を PDF にしてアップロードできます。

### 区分所有者側

1. 区分所有者でログインし、自身が居住するマンションの情報が閲覧できます。
2. マンションのことについてお問い合わせ機能を利用して相談できます。

## アプリケーションを作成した背景

前職の社内顧客管理システムを使用していて、日々お客様より受ける相談履歴を残せる機能がなく、
そういう機能があればいいのにと思うことがあったので作ってみることにしました。

## 洗い出した要件

[要件を定義したシート](https://docs.google.com/spreadsheets/d/1cUHJYNbNabmZ3tyBxqZC4g18f3W8ZzCIvhzf6Lt296o/edit#gid=982722306)

## 実装した機能についての画像や GIF およびその説明

### 各トップページ(2023/11/12 最新)

- 管理者
  [![管理者](https://i.gyazo.com/fa37f506a9dc5fab235f2c932708b763.png)](https://gyazo.com/fa37f506a9dc5fab235f2c932708b763)
- 役職者
  [![役職者](https://i.gyazo.com/7597e0e6905f170f38673bc9d28c6473.png)](https://gyazo.com/7597e0e6905f170f38673bc9d28c6473)
- 一般社員
  [![Image from Gyazo](https://i.gyazo.com/8f4e36fd3c76db0326b6f828e7405178.png)](https://gyazo.com/8f4e36fd3c76db0326b6f828e7405178)
- 区分所有者
  [![Image from Gyazo](https://i.gyazo.com/187dea39fef010c36d1bbf8f1b63db6c.png)](https://gyazo.com/187dea39fef010c36d1bbf8f1b63db6c)

### 通知一覧ページ

- 一般社員
  [![Image from Gyazo](https://i.gyazo.com/bac3b900b25a9553a615298fffe4320c.png)](https://gyazo.com/bac3b900b25a9553a615298fffe4320c)
- 区分所有者
  [![Image from Gyazo](https://i.gyazo.com/2b0cb62f4e1f5ddec0b4d8fd29d52fd7.png)](https://gyazo.com/2b0cb62f4e1f5ddec0b4d8fd29d52fd7)

### 管理者ユーザーによる各種新規登録画面へのアクセス

[![管理者ユーザーによる各種新規登録](https://i.gyazo.com/56387887ae74a866894fed11542917de.gif)](https://gyazo.com/56387887ae74a866894fed11542917de)

### マンション登録画面の挙動

[![マンション登録挙動](https://i.gyazo.com/6924881eb8b288ca6982d4baf84a0bad.gif)](https://gyazo.com/6924881eb8b288ca6982d4baf84a0bad)

### 管理者画面

[![管理者画面](https://i.gyazo.com/9378279c7f524a1e05db21e58a7779ae.gif)](https://gyazo.com/9378279c7f524a1e05db21e58a7779ae)

### 社員に紐づけた物件(担当物件)の情報表示

[![社員による各物件情報表示](https://i.gyazo.com/fa796a1a366eddde1b61674749a7c24a.gif)](https://gyazo.com/fa796a1a366eddde1b61674749a7c24a)

### 区分所有者ログイン、マンション情報表示

[![区分所有者ログイン、マンション情報表示](https://i.gyazo.com/80b6bf645e6b07ae62389f2b0d132ffe.gif)](https://gyazo.com/80b6bf645e6b07ae62389f2b0d132ffe)

### マンションの書類閲覧機能

[![書類一覧表示](https://i.gyazo.com/2066da662dd049982fd5cb96942638f6.gif)](https://gyazo.com/2066da662dd049982fd5cb96942638f6)

### マンションの各種区画情報

[![Image from Gyazo](https://i.gyazo.com/28d3a5810b93e7689dcbe29510628057.png)](https://gyazo.com/28d3a5810b93e7689dcbe29510628057)

### 権限のない社員で区分所有者登録画面へアクセス

[![権限のない社員で区分所有者登録画面へアクセス](https://i.gyazo.com/c982efdd1bb54cfeaee50ae53165956a.gif)](https://gyazo.com/c982efdd1bb54cfeaee50ae53165956a)

### 権限の分け方の一例

[![Image from Gyazo](https://i.gyazo.com/0d3f5b4479b9d02bd8b3c62668dc03d9.png)](https://gyazo.com/0d3f5b4479b9d02bd8b3c62668dc03d9)

### 区分所有者がお問い合わせ機能を利用して投稿

[![Image from Gyazo](https://i.gyazo.com/b9363b0aed602d053f07353cc22f95b4.gif)](https://gyazo.com/b9363b0aed602d053f07353cc22f95b4)

### 管理会社の社員が、担当物件の区分所有者からの問い合わせを確認

[![Image from Gyazo](https://i.gyazo.com/9e14433afd77aca05de6c6ebe71636b3.gif)](https://gyazo.com/9e14433afd77aca05de6c6ebe71636b3)

## 今後実装したい機能

- 投票(アンケート、総会)
- 修繕履歴
- 駐車場等の区画契約情報管理機能

## データベース設計

[![Image from Gyazo](https://i.gyazo.com/1190abccba676d94f8fc89357fafcb48.png)](https://gyazo.com/1190abccba676d94f8fc89357fafcb48)

### Users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

#### Association

- has_many :condos
- has_many :condo_users
- has_many :condo_user_post_replies
- has_many :visited_notifications
- has_many :visitor_notifications

### Condos テーブル

| Column                          | Type       | Options                        |
| ------------------------------- | ---------- | ------------------------------ |
| user                            | references | null: false, foreign_key: true |
| condo_name                      | string     | null: false                    |
| postal_code                     | string     | null: false                    |
| condo_address                   | string     | null: false                    |
| floor                           | integer    | null: false                    |
| basement_floor                  | integer    |                                |
| total_number_of_unit            | integer    | null: false                    |
| completion_year                 | integer    | null: false                    |
| structure_id                    | integer    | null: false                    |
| site_area                       | float      | null: false                    |
| total_floor_area                | float      | null: false                    |
| maintenance_fee                 | float      | null: false                    |
| repair_reserve_fund             | float      | null: false                    |
| management_company_name         | string     | null: false                    |
| management_company_postal_code  | string     | null: false                    |
| management_company_address      | string     | null: false                    |
| management_company_phone_number | string     | null: false                    |
| management_type_id              | integer    | null: false                    |

#### Association

- belongs_to :user
- has_many :condo_users
- has_many :condo_user_posts

### CondoUsers テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| user                       | references | null: false, foreign_key: true |
| condo                      | references | null: false, foreign_key: true |
| room_number                | integer    | null: false                    |
| condo_user_last_name       | string     | null: false                    |
| condo_user_first_name      | string     | null: false                    |
| condo_user_last_name_kana  | string     | null: false                    |
| condo_user_first_name_kana | string     | null: false                    |
| condo_user_address         | string     | null: false                    |
| condo_user_phone_number    | string     | null: false                    |
| email                      | string     | null: false, unique: true      |
| encrypted_password         | string     | null: false,                   |

#### Association

- belongs_to :user
- belongs_to :condo
- has_many :condo_user_posts
- has_many :condo_user_post_replies
- has_many :visited_notifications
- has_many :visitor_notifications

### CondoUserPosts テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| condo      | references | null: false, foreign_key: true |
| condo_user | references | null: false, foreign_key: true |
| title      | string     | null: false                    |
| content    | text       | null: false                    |
| status     | integer    | null: false, default: 0        |

#### Association

- belongs_to :condo
- belongs_to :condo_user
- has_many :notifications

### CondoUserPostReplies テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| condo_user      | references | null: false, foreign_key: true |
| condo_user_post | references | null: false, foreign_key: true |
| content         | text       |                                |

#### Association

- belongs_to :user
- belongs_to :condo_user
- belongs_to :condo_user_post
- has_many :notifications

### Notifications テーブル

| Column                   | Type       | Options                                             |
| ------------------------ | ---------- | --------------------------------------------------- |
| visitor_id               | references | null: false, polymorphic: true                      |
| visited_id               | references | null: false, polymorphic: true                      |
| condo_user_post_id       | references | foreign_key: true                                   |
| condo_user_post_reply_id | references | foreign_key: { to_table: :condo_user_post_replies } |
| action                   | string     | default: '', null: false                            |
| checked                  | boolean    | default: false, null: false                         |

#### Association

- belongs_to :visitor
- belongs_to :visited
- belongs_to :condo_user_post
- belongs_to :condo_user_post_reply

### Documents テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| condo       | references | null: false, foreign_key: true |
| title       | string     | null: false                    |
| category_id | integer    | null: false                    |

#### Association

- belongs_to :user
- belongs_to :condo

### Parkings テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| condo               | references | null: false, foreign_key: true |
| parking_number      | string     | null: false                    |
| vehicle_type_id     | integer    | null: false                    |
| parking_type_id     | integer    | null: false                    |
| roof                | boolean    | null: false, default: false    |
| special_category_id | integer    |                                |

#### Association

- belongs_to :condo

### Contracts テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| condo_user         | references | null: false, foreign_key: true |
| parking            | references | null: false, foreign_key: true |
| vehicle_type_id    | integer    | null: false                    |
| vehicle_model_code | string     |                                |
| vehicle_number     | string     |                                |
| start_date         | date       | null: false                    |
| end_date           | date       | null: false                    |

#### Association

- belongs_to :condo_user
- belongs_to :parking

## 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/6f2b243f601d42465141bc084b1db3c7.png)](https://gyazo.com/6f2b243f601d42465141bc084b1db3c7)

## 開発環境

- Ruby
- Ruby on Rails, JavaScript
- MySQL
- Github
- Render
- Visual Studio Code

## ローカルでの動作方法

```
$ git clone https://github.com/sumachanabc/Rem
$ cd xxxxxx
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
$ rails server
$ http://localhost:3000
```

## 工夫したポイント

- 権限管理を導入して実務を意識
- 管理者画面実装
- admin や manage のみ新規登録などのアクションを許可
- エラーハンドリング日本語化
- レスポンシブ対応
- 一部入力項目をアクティブハッシュで実装
- ポリモーフィック関連を使用した通知機能
