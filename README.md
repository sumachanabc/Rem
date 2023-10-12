# rem

このプロジェクトは、マンション、区分所有者、社員のデータ管理を行うシステムです。

## 機能

- マンション登録データの投稿、一覧表示、詳細表示、編集、削除
- 区分所有者データの投稿、一覧表示、詳細表示、編集、削除
- 社員データの投稿、一覧表示、詳細表示、編集、削除

## 使い方

1. 権限のあるユーザーが社員ユーザーを登録します。
2. 権限のあるユーザーがマンションをデータ登録します。
3. 権限のあるユーザーがマンションの区分所有者を登録します。
4. 社員ユーザーでログインしてマンションや区分所有者のデータを表示できます。

## インストール

```
$ git clone https://github.com/sumachanabc/Rem
$ bundle install
$ db:create
$ db:migrate
$ rails server
$ http://localhost:3000
```

## 本番環境

[Rem](https://rem-6zkh.onrender.com/)
ID：admin
PASS：2222

## 作者

SN_sumachan
