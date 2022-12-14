# ittoku-tech

このリポジトリは、ドメインittoku-tech.comのプロジェクトをまとめる場所です。さまざまな設定ファイルを置いていく予定です。

下記のURLは、このプロジェクトに関係あるURLです。アクセスして確認して見ましょう。

**ittoku-tech.com**

- [api.ittoku-tech.com](https://api.ittoku-tech.com)
- [blog.ittoku-tech.com](https://blog.ittoku-tech.com)

**リポジトリ**

- api (Ruby on Rails): https://github.com/ittoku-ky73/api-ittoku-tech
- blog (Node/Express): https://github.com/ittoku-ky73/blog-ittoku-tech

### 環境構築

開発環境を構築します。

1. `make clone_repo`
2. `make setup`
3. `make up`
4. open [blog](http://localhost:3000)
5. open [api](http://localhost:8000)

テスト環境を構築します。そのためにまず開発環境を落とす必要があります。その後に構築といった流れになります。テストを終える時も落としておきましょう。

1. `make setup_test`
2. `make up_test`
3. `make api_test`
4. `make web_test`
5. `make down_test`
