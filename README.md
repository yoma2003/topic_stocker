![github_logo](https://user-images.githubusercontent.com/102401730/185775306-d0248145-5160-47bd-8280-afb445fab89e.jpg)
# アプリケーション名
**Topic Stocker**

# URL
**https://topicstocker.com/**

# 概要
- イベントや飲み会など、多くの人と情報交換をする人のための、話題管理アプリ。
- 「誰と」「いつ」「何を話したか」「次に何を話したいか」を記録しカテゴリ毎に管理できる。
- 利用シーンは、イベント参加後の記録、イベント参加前の情報確認を想定。

# 利用イメージ

![sample_1](https://user-images.githubusercontent.com/102401730/185894751-59ff3c05-ef5e-40ce-b62c-4585e11d3d53.gif)

# 利用方法
## ユーザーログイン、登録
![ユーザーログイン・登録](https://user-images.githubusercontent.com/102401730/186210158-c45ca366-4a07-44b4-a1fc-ccf37aeef0d1.png)

## データ登録

![データ登録](https://user-images.githubusercontent.com/102401730/186210180-37c13d10-d986-40f7-9785-fd06d8986f32.png)

## データ編集、詳細編集

![データ編集・詳細編集](https://user-images.githubusercontent.com/102401730/186210210-07f68ea4-36f4-403e-abff-7f8a53c5de2b.png)

## カテゴリ追加、編集

![カテゴリ追加・編集](https://user-images.githubusercontent.com/102401730/186210232-ae0b0f85-fc4b-4737-a74f-82d99e99eacb.png)

# アプリケーションを作成した背景

前職の薬剤師において、イベントを多数主催する友人にヒアリングをした際、「話しをした人の情報を管理しにくい」という課題を発見した。
私はイベントに参加していて、人と「何を話したか」を記録できれば、より人の情報を管理しやすいのではないかと考えた。
また、「何を話したか」ば次のコミュニケーションのきっかけにもなるのではないかと考えた。
「話題」は、メモアプリでは管理が煩雑になり、名刺管理アプリでは蓄積する情報を管理しにくい。
そこで、「いつ」「誰と」「何を話したか」「次に何を話したいか」を記録できる、話題管理アプリを開発した。

# 要件定義書
https://docs.google.com/spreadsheets/d/1PHPF3jtXuHywOdnAqtzP8D0dRn7q1djGeHJsFu35wSs/edit#gid=1217619759

# 機能一覧
## メイン機能
- ユーザーログイン機能
- ユーザー管理機能（登録・編集・削除）
- 画像アップロード機能（AWS S3）
- 人データ管理機能（CRUD / Formオブジェクト / Ajax通信）
- 話題データ管理機能（CRUD / Formオブジェクト / Ajax通信）
- カテゴリ管理機能（CRUD / 多対多のアソシエーション）
- ゲストログイン機能
- データソート機能

## その他
- アコーディオンパネル（JavaScript）
- 画像データサンプル表示機能（JavaScript）
- 画像投稿のバリデーション機能
- 投稿画像のリサイズ機能
- ユーザーフィードバック機能（Google Forms）
- モデル単体テスト（Rspec）

## インフラ
- 独自ドメイン設定（AWS Route53）
- 常時SSL化（AWS ACM × ELB）

## 今後の実装予定
- レスポンシブ対応
- カテゴリ手動並べ替え機能
- SNS連携ログイン機能（SNS API）
- SNS画像取得機能（SNS API）
- カレンダーピッカー（JavaScriptライブラリ）
- クエリ回数の削減

# 工夫したポイント

## トップページで主要なデータ編集が行えるアプリ設計
  `Ajax通信`を用いて、「ページ遷移をせずにフォームを追加・削除する機能」や、「フォーム外のクリックで編集データを自動更新する機能」を作成し、トップページで主要なデータ編集が行えるアプリ設計にした。

## データが見やすく編集しやすいデザイン設計
  `JavaScript`のフロント操作によって、「一覧データをクリックすると詳細編集がそのまま行えるデザイン設計」にした。

## アプリのスピード
  アクセススピードの早い`AWS`でのインフラ構築を行った。また、処理速度が指摘されるjQuery等のフレームワークを使用せず、学習を兼ねて生の`JavaScript`でのフロント実装にこだわった。

# 開発環境
- フロントエンド<br>
HTML / CSS / JavaScript

- バックエンド<br>
Ruby 2.6.5 / Ruby on Rails 6.0.5

- データベース<br>
MySQL 5.7.36

- テスト<br>
Rspec-rails 5.1.2

- ソースコード管理<br>
Git / GitHub

- インフラ環境<br>
AWS：VPC / EC2 / RDS/ S3 / Route53 / ELB / ACM / IAM<br>
Webサーバー：Nginx 1.20.0<br>
Applicationサーバー：Puma 3.12.6<br>

- 開発ツール<br>
テキストエディタ：VScode<br>
フロントデザイン：Figma<br>
Git管理：GitHub Desktop<br>

- ユーザーフィードバック<br>
Google Forms

- タスク管理<br>
GitHubプロジェクトボード

# データベース設計

![tables](https://user-images.githubusercontent.com/102401730/183283768-cb9daabf-98c4-434f-94bb-3769d1a66bfd.jpg)

# 画面遷移図

![diagram](https://user-images.githubusercontent.com/102401730/183306649-c636a7e2-579e-4ff5-8a9d-33ee39dd7da9.png)

# AWSインフラ構成

![infra_1](https://user-images.githubusercontent.com/102401730/185748367-f32dad58-a6a1-49c0-9e8e-42e864595995.png)

# ローカルでの動作方法
% git clone https://github.com/yoma2003/topic_stocker.git<br>
% cd topic_stocker<br>
% bundle install<br>
% rails db:create<br>
% rails db:migrate<br>

# 開発期間
約6週間（1日平均作業時間：約10時間）

# 作成者

- 作成者：yoma2003
- twitter：[@yoma_2003](https://twitter.com/yoma_2003)
- Qiita：[@yoma2003](https://qiita.com/yoma2003)

# アウトプットした関連技術記事

# 苦労したポイント
- 要件定義やデータベース設計<br>
技術的な問題よりも、どういうアプリ設計にすればユーザーが使いやすいか、要件定義やデータベース設計に一番苦労した。

- AWSでのインフラ構築<br>
またAWSでのインフラ構築は開発環境により差が出てくるため、いろいろな記事を見つつもエラーをなかなか解決できず苦労した。