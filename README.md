## アプリケーション名

### **Rem**

## アプリケーション概要

分譲マンション管理組合のサポートをするために作られ、マンション、区分所有者、社員等のデータ管理を行うアプリです。

## URL

[https://rem-6zkh.onrender.com/](https://rem-6zkh.onrender.com/)

## ベーシック認証

ID：admin  
PASS：2222

## テスト用アカウント

# ---管理会社---

# admin

- email: fff@example.com
- password: fff444

# manage

- email: jjj@example.com
- password: 444fff

# employee

- email: qqq@example.com
- password: 111qqq

- email: www@example.com
- password: 222www

- email: eee@example.com
- password: 333eee

## 機能

- マンション登録データの登録、一覧表示、詳細表示
- 区分所有者データの登録、一覧表示
- 社員データの登録
- 社員ごとの権限管理

## 利用方法

### 管理会社側

1. 権限のあるユーザーが社員ユーザーを登録します。
2. 権限のあるユーザーがマンションをデータ登録します。
3. 権限のあるユーザーがマンションの区分所有者を登録します。
4. 社員ユーザーでログインして担当のマンションの情報や区分所有者のデータを表示できます。

### 区分所有者側

1. 区分所有者でログインし、自身が居住するマンションの情報が閲覧できます。

### アプリケーションを作成した背景

前職の社内顧客管理システムを使用していましたが、日々お客様より受ける相談履歴を残せる機能がなく、
そういう機能があればいいのにと思うことがあったので作ってみることにしました(現時点では実装予定の機能)。

## 洗い出した要件

[要件を定義したシート](https://docs.google.com/spreadsheets/d/1cUHJYNbNabmZ3tyBxqZC4g18f3W8ZzCIvhzf6Lt296o/edit#gid=982722306)

## 実装した機能についての画像や GIF およびその説明

### 管理者ユーザーによる各種新規登録画面へのアクセス

[![管理者ユーザーによる各種新規登録](https://i.gyazo.com/56387887ae74a866894fed11542917de.gif)](https://gyazo.com/56387887ae74a866894fed11542917de)

### マンション登録画面の挙動

[![マンション登録挙動](https://i.gyazo.com/6924881eb8b288ca6982d4baf84a0bad.gif)](https://gyazo.com/6924881eb8b288ca6982d4baf84a0bad)

### 社員に紐づけた物件(担当物件)の情報表示

[![社員による各物件情報表示](https://i.gyazo.com/fa796a1a366eddde1b61674749a7c24a.gif)](https://gyazo.com/fa796a1a366eddde1b61674749a7c24a)

### 区分所有者ログイン、マンション情報表示

[![区分所有者ログイン、マンション情報表示](https://i.gyazo.com/80b6bf645e6b07ae62389f2b0d132ffe.gif)](https://gyazo.com/80b6bf645e6b07ae62389f2b0d132ffe)

### 権限のない社員で区分所有者登録画面へアクセス

[![権限のない社員で区分所有者登録画面へアクセス](https://i.gyazo.com/c982efdd1bb54cfeaee50ae53165956a.gif)](https://gyazo.com/c982efdd1bb54cfeaee50ae53165956a)

### 権限の分け方の一例

[![Image from Gyazo](https://i.gyazo.com/cd175af8ed02bd72b9deb3f55dd87315.png)](https://gyazo.com/cd175af8ed02bd72b9deb3f55dd87315)

## 今後実装したい機能

- マンション登録データの編集、削除
- 区分所有者データの詳細表示、編集、削除
- 社員データの一覧表示、詳細表示、編集、削除
- 駐輪場駐車場管理、相談履歴、書類保管閲覧、組合役員閲覧
- 簡易投票(アンケート)、管理画面、更新履歴
- 投票(総会)、マンション毎のチャット/掲示板
- 会計機能、csv 出力
- 修繕履歴

## データベース設計

[![Image from Gyazo](https://i.gyazo.com/9078763fd49f98da9dd3a4f68faf5a28.png)](https://gyazo.com/9078763fd49f98da9dd3a4f68faf5a28)

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
| structure_id                    | string     | null: false                    |
| site_area                       | float      | null: false                    |
| total_floor_area                | float      | null: false                    |
| parking_space                   | integer    |                                |
| bicycle_parking_space           | integer    |                                |
| maintenance_fee                 | float      | null: false                    |
| repair_reserve_fund             | float      | null: false                    |
| management_company_name         | string     | null: false                    |
| management_company_postal_code  | string     | null: false                    |
| management_company_address      | string     | null: false                    |
| management_company_phone_number | string     | null: false                    |
| management_type_id              | string     | null: false                    |

#### Association

- belongs_to :user
- has_many :condo_users

### CondoUsers テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
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

### Association

- belongs_to :condo

## 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/57546a3221aeb192eb3a90a094a7df44.png)](https://gyazo.com/57546a3221aeb192eb3a90a094a7df44)

## 開発環境

- Ruby
- Ruby on Rails
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
- エラーハンドリング日本語化
- レスポンシブ対応
- 一部入力項目をアクティブハッシュで実装
