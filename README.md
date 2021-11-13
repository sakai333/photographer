# Photographer
Photographerは写真好きのためのコミュニティーサイトです。  
写真投稿・閲覧機能に加えて、誰でも気軽に開催・投票できるコンテスト機能、写真レビューや質問ができる掲示板機能を実装しています。
<img width="1738" alt="7e8a7f6a-9be1-43f7-ac9e-26fa502e161d" src="https://user-images.githubusercontent.com/61400888/141602525-2306fa00-ba4d-472f-ae44-69f40e14ffad.png">


## URL
https://photographer-sk.herokuapp.com/

## 使用技術
- フロントエンド
  - HTML/CSS
  - Javascript
- バックエンド
  - Ruby 2.5.8
  - Ruby on Rails 5.2.4
  - Rubocop（コード解析ツール)
  - Rspec（テスト)
- インフラ
  - docker/docker-compose
  - AWS(VPC、ACM、Route53、EC2、RDS、S3)→ heroku移行
  - PostgreSQL 11.9

## 基本一覧
- 基本機能
  - 新規登録・ログイン機能
  - ユーザー情報編集機能(アイコン画像・ユーザー名・メールアドレス・使用カメラ・写真ジャンル)
  - ユーザーフォロー機能（非同期通信）
- 写真投稿機能
  - 新規投稿（画像投稿にはcarrierwaveを使用。本番環境ではS3に保存。）
  - 写真一覧ページから各投稿の詳細ページをmodal表示（非同期通信）
  - コメント機能（非同期通信）
  - いいね機能（非同期通信）
- コンテスト機能
  - 新規コンテスト開催機能（期限・条件を設定）
  - 投票機能（1コンテストにつき1人3票まで投票可能）
  - 期限になると投票を集計し結果が表示される
- 掲示板機能
  - 新規投稿
  - コメント機能（非同期通信）
