# テーブル設計

## usersテーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false               |
| encrypted_password  | string | null: false, unique: true |
| last_name           | string | null: false               |
| first_name          | string | null: false               |
| last_name_initials  | string | null: false               |
| first_name_initials | string | null: false               |
| birth_date          | string | null: false               |

### Association
- has_many :items
- has_many :buys


## itemsテーブル

| Column              | Type       | Options     |
| ------------------- | -----------| ----------- |
| product             | string     | null: false |
| product_description | text       | null: false |
| category            | string     | null: false |
| product_status      | string     | null: false |
| price               | string     | null: false |
| ship_addrres        | string     | null: false |
| freight             | string     | null: false |
| due_date            | string     | null: false |
| user                | references | null: false, foreign_key: true |

### Association
- belongs :users
- has_one :buys
- has_one_attached :image

## addressテーブル

| Column              | Type       | Options     |
| ------------------- | -----------| ----------- |
| postal_code         | string     | null: false |
| state               | text       | null: false |
| city                | string     | null: false |
| street              | string     | null: false |
| building_name       | string     | null: true  |
| phone               | string     | null: false |

### Association

- belongs :buys

## buysテーブル

| Column              | Type       | Options                        |
| ------------------- | -----------| ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association

- belongs :user
- belongs :address
- has_one :buys