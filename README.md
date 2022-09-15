![github_logo](https://user-images.githubusercontent.com/102401730/185775306-d0248145-5160-47bd-8280-afb445fab89e.jpg)
# アプリケーション名
**Topic Stocker**

# URL
**https://topicstocker.com/**<br>
**※ 試用の場合は、「ゲストログイン」からアカウント登録をせずにログインが可能**

# 概要
**「誰と」「いつ」「何を話したか」「次に何を話したいか」を記録できる話題管理アプリ**
- **特徴：トップページのみで「話題データの追加・削除・更新」ができる。**
- ターゲット：イベントや飲み会など、多くの人と情報交換をする人。
- 利用シーン：イベント参加後の記録、イベント参加前の情報確認。

# イメージ

![sample_1](https://user-images.githubusercontent.com/102401730/185894751-59ff3c05-ef5e-40ce-b62c-4585e11d3d53.gif)

# 利用方法
## 1. ユーザーログイン

![ユーザーログイン・登録_1](https://user-images.githubusercontent.com/102401730/187099546-c7cbfb2a-ab5e-4bcc-8527-d695ede16bf1.png)

## 2. 人の情報・話題を登録する

![データ登録_1](https://user-images.githubusercontent.com/102401730/186561205-3bf59bb5-dec6-42c7-b9a2-d651648d0e5b.png)

## 3. データを編集する

![データ編集・詳細編集_2](https://user-images.githubusercontent.com/102401730/187100332-ce8ef3e7-30b3-4271-87ba-dfc99d7b293c.png)

## 4. カテゴリ毎にまとめる

![カテゴリ追加・編集_2](https://user-images.githubusercontent.com/102401730/187100330-9a65b220-04c3-442e-83b8-ef3ab5abaed8.png)

# アプリケーションを作成した背景

私は以前からイベントや飲み会において、「話した人の事を覚えづらい」という問題を感じてきた。<br>
同様の問題認識を持つ友人と原因分析をし、「人となりをメモをしても、話した内容は蓄積する情報なので管理するのが難しい」ということが原因だと考えた。<br>
既存のメモアプリでは管理が煩雑になり、名刺管理アプリでは蓄積する情報を管理できない。<br>
そこで私は、この「話題」を中心に人の情報を管理できるアプリを開発しようと考えた。

# 要件定義
[要件定義シート](https://docs.google.com/spreadsheets/d/1PHPF3jtXuHywOdnAqtzP8D0dRn7q1djGeHJsFu35wSs/edit#gid=1217619759)

# 機能一覧
### メイン機能
- ユーザーログイン機能（devise）
- ユーザー管理機能（CRUD）
- 人データ管理機能（CURD / Formオブジェクト）
- 話題データ管理機能（CRUD / Formオブジェクト）
- カテゴリ管理機能（CRUD / 多対多のアソシエーション）
- 画像投稿機能（Active Storage / AWS S3）
- フォーム追加・削除機能（Ajax）
- フォームデータ自動保存機能（Ajax）
- ゲストログイン機能
- データソート機能

### その他
- アコーディオンパネル（JavaScript）
- 画像データサンプル表示機能（JavaScript）
- 投稿画像のバリデーション機能
- 投稿画像のリサイズ機能
- ゲストデータ定期初期化機能（1日4回）（whenever）
- ユーザーフィードバック機能（Google Forms）
- 単体テスト（Rspec）

### インフラ
- 独自ドメイン設定（AWS Route53）
- 常時SSL化（AWS ACM × ELB）

### 今後の実装予定
- レスポンシブ対応
- カテゴリ手動並べ替え機能
- SNS連携ログイン機能（SNS API）
- SNS画像取得機能（SNS API）
- カレンダーピッカー（JavaScriptライブラリ）
- 統合テスト（Rspec）

# 工夫したポイント

### 1. ユーザー操作の少ないアプリ設計
Ajax通信を用いて、「ページ遷移をせずにフォームを追加・削除する機能」「フォーム外のクリックやページ遷移で編集データを自動保存する機能」を作成し、トップページでメインのデータ編集が完結するアプリ設計にした。

### 2. データ管理がしやすいデザイン
JavaScriptで、「クリックでデータが開き、そのまま編集が行えるデザイン（トップページ）」を実装した。<br>
デザインの完成度を高めるため、Figmaでデザインカンプを作成してからフロント実装を行なった。

### 3. アプリのスピード
アクセススピードの早いAWSでのインフラ構築を行った。<br>
処理速度が指摘されるjQuery等のフレームワークを使用せず、学習を兼ねて生のJavaScriptでのフロント実装を行った。

# 開発環境
- フロントエンド<br>
HTML / CSS / JavaScript

- バックエンド<br>
Ruby 2.6.5 / Ruby on Rails 6.0.5

- データベース<br>
MySQL 8.0.28

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

![diagram](https://user-images.githubusercontent.com/102401730/187149463-a02111c1-20fb-409d-8b72-2e6671e9a09b.png)

# AWSインフラ構成

![infra_1](https://user-images.githubusercontent.com/102401730/185748367-f32dad58-a6a1-49c0-9e8e-42e864595995.png)

# ローカルでの動作方法
`% git clone https://github.com/yoma2003/topic_stocker.git`

# 開発期間
約6週間（1日平均作業時間：約10時間）

# 作成者
作成者：yoma2003<br>
twitter：[@yoma_2003](https://twitter.com/yoma_2003)<br>
Qiita：[@yoma2003](https://qiita.com/yoma2003)<br>
GitHub：[@yoma2003](https://github.com/yoma2003)
