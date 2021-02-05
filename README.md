# date-match
[![Image from Gyazo](https://i.gyazo.com/631dd1003750712177c7df93cc499aee.jpg)](https://gyazo.com/631dd1003750712177c7df93cc499aee)

# アプリ概要
あなたの行きたい場所やイベントを提案・検索することで、デート相手を効率よく見つけることができるマッチングアプリです。

- 行きたい日時やプランなどを添えて、提案ができる
- 住所やキーワードなどで検索、行きたい日時が近い順などで並び替えができる
- ダイレクトメッセージを通じて、招待ができる

作成背景、工夫した点、苦労した点などをより詳細に解説した記事はこちらです！<br>
[【ポートフォリオ解説】date-matchの全てがこれで分かる！](https://qiita.com/sdkk-rails/private/4f7c6701a17701f79c25)

# URL
https://www.date-match.net/

ゲストログイン機能ですぐに閲覧ができます。<br>
※現在、レスポンシブ対応中です。PC・GoogleChromeでの閲覧推奨です。

[![Image from Gyazo](https://i.gyazo.com/cb3e8eee8a24637a2abe7d22bb08f18f.gif)](https://gyazo.com/cb3e8eee8a24637a2abe7d22bb08f18f)

# 既存アプリとの相違点
- 自分の行きたい場所に共感してくれている人、行きたい日時が合う人から、お相手を効率よく探すことができる
- 自分の行きたい場所や日時ありきで検索ができるので、お相手を効率よく探すことができる
- マッチング時点で、行きたい場所や日時が共有されているので、デートにお誘いしやすい

# 使用技術
* __フロントエンド__
  * __HTML__
  * __CSS ( BEM・FLOCSS )__
  * __Sass 2.1.2__
  * __Bootstrap 4.5.3__
  * __JavaScript__
  * __jQuery 4.4.0__

* __バックエンド__
  * __Ruby 2.5.7__
  * __Ruby on Rails 5.2.3__

* __テスト__
  * __RSpec 4.0.0.beta2 ( モデルテスト、リクエストテスト、 システムテストを約180examples )__
  * __Factory Bot 4.10.0__
  * __RuboCop 2.3.2__

* __開発環境__
  * __Docker 19.03.13__
  * __Docker Compose 1.27.4__
  * __Visual Studio Code 1.44.2__

* __本番環境__
  * __AWS ( VPC, EC2, S3, RDS, Route53, ACM, ALB )__
  * __PostgreSQL 11.5__
  * __nginx 1.12.2__
  * __Unicorn 5.7.0__
  * __CircleCI 2.0__
  * __Capistrano 3.14.1__

# インフラ構成図
[![Image from Gyazo](https://i.gyazo.com/fc575966a5000e9aea3f9177439e61a3.png)](https://gyazo.com/fc575966a5000e9aea3f9177439e61a3)

# 機能一覧
## 1.提案機能
|番号|機能|説明|
|:----:|:------------:|:--------------------------:|
|  1  |提案登録（CRUD）|提案を新規登録、一覧表示、詳細表示、編集、削除できる
|  2  |オートコンプリートによる住所検索（Google Maps API)|名称や店名を入力すると、オートコンプリートで検索候補を補完し、その住所が表示される
|  3  |地図表示（Google Maps API）|ユーザーが登録した住所から、その地点の地図を表示する
|  4  |天気予報表示（Open Weather Map API）|ユーザーが登録した住所から、その地点の天気予報を表示する
|  5  |ハッシュタグ付け（acts-as-taggable-on）|提案にハッシュタグを付けることができて、キーワード検索ができる
|  6  |お気に入り登録・削除（Ajax）|非同期通信でお気に入りに登録・削除ができる
|  7  |行きたい！リクエスト申請・取消（Ajax）|非同期通信で行きたい！リクエストを申請・取消ができる
|  8  |閲覧履歴保存|ユーザーが閲覧した提案を履歴として保存する
|  9  |閲覧数カウント（impressionist）|提案詳細が閲覧された数をカウントする
|  10  |コメント投稿・削除（Ajax）|非同期通信で提案にコメントを投稿・削除できる
|  11  |星5段階評価(Raty.js)|コメント投稿と合わせて、提案を星5段階で評価できる

## 2.ユーザー機能
|番号|機能|説明|
|:----:|:------------:|:--------------------------:|
|  1  |ユーザー登録（CRUD）|ユーザーを新規登録、一覧表示、詳細表示、編集、削除できる
|  2  |ログイン|登録されたユーザーのメールアドレスとパスワードでログインができる
|  3  |ゲストログイン|ユーザー登録をせずに、ログインができる
|  4  |足跡数カウント（impressionist）|ユーザー詳細が閲覧された数をカウントする
|  5  |いいね！申請（Ajax）|非同期通信でいいね！申請ができる
|  6  |ダイレクトメッセージ（Ajax）|非同期通信でマッチングしたユーザー同士のダイレクトメッセージができる

## 3.共通機能
|番号|機能|説明|
|:----:|:------------:|:--------------------------:|
|  1  |写真の複数枚登録・編集・削除（Active Storage）|写真を複数枚登録、編集、削除できる
|  2  |3D フリップスライダー（Swiper）|登録された写真をフリップスライダーで閲覧できる
|  3  |通知|行きたい！リクエストされた時、コメントされた時、いいね！された時、メッセージが届いた時に通知が来る（未確認通知がある場合は、マークを表示）
|  4  |AND検索（ransack）|各検索条件でAND検索ができる
|  5  |検索結果の並び替え（ransack）|検索結果を指定した条件で並び替えできる
|  6  |ページネーション（kaminari,一部Ajax）|表示内容を複数ページに分割できる

# ER図
[![Image from Gyazo](https://i.gyazo.com/e2c2a1e3abd2ab8839c727b70c615c8e.png)](https://gyazo.com/e2c2a1e3abd2ab8839c727b70c615c8e)

# 工夫した点
## 1.ユーザー調査
### `アンケート調査`
- 約30名にdate-matchを使ってもらい、ユーザー目線でのサービスの使用感（操作のしやすさ、見やすさ 等）を調査
- 良かった点、悪かった点を自由記述してもらい、今後の改善点を洗い出す

以下のリンク先に調査結果をまとめました！<br>
[date-match アンケート調査結果](https://docs.google.com/presentation/d/14lzIfpN_Kx4_ba2EvlSe-qxqHdli0Cc6jijH6SUiVd4/edit?usp=sharing)

※以下に、調査結果を一部抜粋しました。

[![Image from Gyazo](https://i.gyazo.com/8cfc89d631cfe5129047fe32e849b6b6.png)](https://gyazo.com/8cfc89d631cfe5129047fe32e849b6b6)

[![Image from Gyazo](https://i.gyazo.com/f07f1472a5e0be574e60e985be620b3c.jpg)](https://gyazo.com/f07f1472a5e0be574e60e985be620b3c)

## 2.バックエンド
### `オートコンプリートによる住所検索機能`
- Google Maps APIを用いて、名称や店名を入力すると、オートコンプリートで検索候補を補完し、その住所が表示される機能を実装
- 提案を入力する時に、わざわざ住所を検索する手間が省ける

[![Image from Gyazo](https://i.gyazo.com/9c1172c5502261d71f185290e72d8389.gif)](https://gyazo.com/9c1172c5502261d71f185290e72d8389)

### `天気予報表示機能`
- Open Weather Map APIを用いて、入力された住所からその地点における天気予報が表示される機能を実装
- お出かけする時に、天気予報をわざわざ確認する手間が省ける

### `非同期通信（Ajax）を用いてユーザーストレスの軽減`
- コメント投稿・削除機能やページネーションなどに非同期通信（Ajax）を用いてユーザーストレスの軽減を実現

[![Image from Gyazo](https://i.gyazo.com/92b86283037bb167697f9d52d61a7ab4.gif)](https://gyazo.com/92b86283037bb167697f9d52d61a7ab4)

## 3.インフラ
### `CircleCIによる自動テスト・自動デプロイ`
- CircleCIによる自動テスト・自動デプロイ環境を構築し、開発効率を向上
- デプロイ前にバグを検知できるように、Rspec、RuboCopによるテストが通らないとデプロイできない環境を構築

# 今後の実装予定
* __フロントエンド__
  * __レスポンシブ対応__
  * __SPAの導入によるUI/UXの向上__

* __バックエンド__
  * __提案されたデートのカテゴリー分け機能__
  * __現在地からの距離検索機能__
  * __迷惑ユーザーのブロック機能__

* __インフラ__
  * __ECS(EKS)でのデプロイ__
  * __インフラのコード化__

* __その他__
  * __Railsのバージョンアップ__
  * __テストコードの充実__

# 作者
現在Web系エンジニアを目指して、転職活動中です。
以下に、WantedlyのプロフィールやTwitterのリンクがありますので、
もし、少しでも興味を持って頂けましたら、ご連絡を頂けますと幸いです。

- Wantedly　https://www.wantedly.com/id/sdkk_tkks
- Twitter　https://twitter.com/sdkk_tkks
