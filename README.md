# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :characters, dependent: :destroy
- has_many :categories, dependent: :destroy

## characters テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| url      | string     |                                |
| describe | text       |                                |
| user_id  | references | null: false, foreign_key: true |

- image保存はActiveStorageを使用

### Association

- belongs_to :user 
- has_many :past_topics, dependent: :destroy
- has_many :future_topics, dependent: :destroy
- has_many :character_categories
- has_many :categories, through: :character_categories

## past_topics テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| past_topic   | text       |                                |
| created_date | date       | null: false                    |
| character_id | references | null: false, foreign_key: true |

### Association

- belongs_to :character

## future_topics テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| future_topic | text       |                                |
| character_id | references | null: false, foreign_key: true |

### Association

- belongs_to :character

## character_categories テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| character_id | references | null: false, foreign_key: true |
| category_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :character
- belongs_to :category

## categories テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| describe | text       |                                |
| user_id  | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- has_many :character_categories
- has_many: characters, through: :character_categories