# Session Login

ユーザー登録、ログイン、ログアウト、ログインユーザーのプロフィール表示を通して、Railsのセッション認証を学ぶためのサンプルアプリです。

## Requirements

- Ruby 4.0.5
- Bundler 4.0.10
- Ruby on Rails 8.1.3
- PostgreSQL 18.4
- Node.js 24.18.0 LTS (Krypton)
- Yarn 1.22.22

JavaScriptは既存構成のWebpacker 5とTurbolinksを使用します。

## Setup

PostgreSQLを起動してから、次のコマンドを実行してください。

```sh
bundle install
yarn install --frozen-lockfile
bin/rails db:prepare
```

開発環境では、OSのユーザー名と同名のPostgreSQLロールを使用し、`session_login_development`と`session_login_test`を作成します。接続先を変更する場合は、Rails標準の`DATABASE_URL`を設定してください。

## Start the server

```sh
bin/rails server
```

<http://localhost:3000> を開きます。

## Test

```sh
bundle exec rails test
```

## Asset build

production用assetを確認する場合は、次のコマンドを実行します。

```sh
RAILS_ENV=production SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile
```

## Production environment variables

- `SESSION_LOGIN_DATABASE_PASSWORD`: `session_login` PostgreSQLロールのパスワード
- `RAILS_MASTER_KEY`: encrypted credentialsを利用する場合のmaster key
- `RAILS_SERVE_STATIC_FILES`: Railsから静的ファイルを配信する場合に設定
- `RAILS_LOG_TO_STDOUT`: Railsログを標準出力へ送る場合に設定
- `DATABASE_URL`: productionのDB接続情報をまとめて指定する場合に設定
