# ittoku-tech

このリポジトリは、ドメインittoku-tech.comのプロジェクトをまとめる場所です。さまざまな設定ファイルを置いていく予定です。

### 環境構築

開発環境を構築します。

1. `make clone_repo`
2. `make setup`
3. `make run`
3. open http://localhost:3000

### テスト環境

テスト環境を構築します。そのためにまず開発環境を落とす必要があります。その後に構築といった流れになります。テストを終える時も落としておきましょう。

1. `make down`
2. `make test_setup`
3. `make test_run`
4. `make test`
5. `make test_down`
