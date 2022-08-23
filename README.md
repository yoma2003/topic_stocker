![github_logo](https://user-images.githubusercontent.com/102401730/185775306-d0248145-5160-47bd-8280-afb445fab89e.jpg)
# アプリケーション名
**Topic Stocker**

# URL
**https://topicstocker.com/**

# 概要
- 「誰と」「いつ」「何を話したか」「次に何を話したいか」を記録しカテゴリ毎に管理できる。
- イベントや飲み会など、多くの人と情報交換をする人のための、話題管理アプリ。
- 利用シーンは、イベント参加後の記録やイベント参加前の人の情報確認を想定している。

# 利用イメージ

![sample_1](https://user-images.githubusercontent.com/102401730/185894751-59ff3c05-ef5e-40ce-b62c-4585e11d3d53.gif)

# 利用方法
## ユーザーログイン、登録・編集
- 「アカウント登録」からユーザー情報を登録し、ログインする。<br>
  **※試用の場合は「ゲストログイン」からログイン可能。**
- ユーザー情報の編集はトップ画面右上のプルダウンから可能。

![ユーザー登録](https://user-images.githubusercontent.com/102401730/186053978-a8af21ed-c288-4cd2-8c47-af5cb13796d3.png)

## データ登録
- 「新規データ登録」から、登録したい人の情報を登録する。

![データ登録](https://user-images.githubusercontent.com/102401730/186053996-17e22fd7-0828-4508-b4e8-e0e949793c1b.png)

## データ編集、追加、削除
- 編集したい人をクリックし、「何を話したか」「次に何を話したいか」を編集する。<br>
  **（フォーム外クリックで自動更新）**<br>
  **（フォームの追加・削除で、「何を話したか」は連続して登録できる）**
- 編集したい人の「詳細編集」から登録情報の詳細を編集する。<br>

![データ追加・編集](https://user-images.githubusercontent.com/102401730/186054021-39fc512a-b0ea-4cbf-a65c-6eb680c4e319.png)

## カテゴリ追加、編集
- 「カテゴリ追加」からカテゴリを新しく追加する。
- 「カテゴリ編集」からカテゴリ情報を編集できる。

![カテゴリ登録・編集](https://user-images.githubusercontent.com/102401730/186054039-2553863e-055a-4cbf-8d4b-cbf28abc262a.png)

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
- 人データ管理機能（CRUD / Formオブジェクトパターン / Ajax非同期通信）
- 話したことデータ管理機能（CRUD / Formオブジェクトパターン / Ajax非同期通信）
- 話したいことデータ管理機能（CRUD / Formオブジェクトパターン / Ajax非同期通信）
- カテゴリ管理機能（CRUD / 多対多のアソシエーション）

## その他
- ゲストログイン機能
- データソート機能
- アコーディオンパネル（JavaScript）
- 画像データサンプル表示機能（JavaScript）
- 画像投稿バリデーション・リサイズ
- ユーザーフィードバック機能（Google Forms）
- モデル単体テスト（Rspec）

## インフラ
- 独自ドメインの設定（AWS Route53）
- 常時SSL化（AWS ACM × ELB）

## 今後の実装予定
- レスポンシブ対応
- カテゴリ並べ替え機能
- SNS連携ログイン機能（SNS API）
- SNS画像取得機能（SNS API）
- カレンダーピッカー（JavaScriptライブラリ）
- 統合テスト（Rspec）
- クエリ回数の削減

# 工夫したポイント

## トップページで主要なデータ編集が行え、ユーザー操作の少ないアプリ設計
- ページ遷移をせずにフォームを追加・削除する機能<br>
Ajaxによる非同期通信を用いて、フォームの追加・削除を行える様にし、ページ遷移をせずに連続投稿できるようにした。

- データの自動更新機能<br>
Ajaxによる非同期通信を用いて、フォーム外のクリック・ページ更新でデータを自動更新できるようにした。

## データが見やすく編集しやすいデザイン設計
- 動きのあるデザイン<br>
JavaScriptのフロント操作によって、一覧データをクリックすると詳細が開き、編集をそのまま行えるデザイン設計にした。

## アプリのスピード
- AWSでのインフラ構築<br>
実際のユーザー使用を想定し、アクセススピードの早いAWSでのインフラ構築を行った。

- 生のJavaScriptでのフロント実装<br>
処理速度が指摘されるjQuery等のフレームワークを使用せず、学習も兼ねて生のJavaScriptでのフロント実装にこだわった。

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