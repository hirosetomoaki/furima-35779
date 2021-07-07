# テーブル設計

## usersテーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| last_name           | string | null: false               |
| first_name          | string | null: false               |
| last_name_initials  | string | null: false               |
| first_name_initials | string | null: false               |
| birth_date          | date   | null: false               |

### Association
- has_many :items
- has_many :buys


## itemsテーブル

| Column              | Type       | Options     |
| ------------------- | -----------| ----------- |
| product             | string     | null: false |
| product_description | text       | null: false |
| category.id         | integer    | null: false |
| product_status.id   | integer    | null: false |
| price               | integer    | null: false |
| ship_addrres.id     | integer    | null: false |
| freight,id          | integer    | null: false |
| due_date.id         | integer    | null: false |
| user                | references | null: false, foreign_key: true |

### Association
- belongs :user
- has_one :buy
- has_one_attached :image

## addressテーブル

| Column              | Type       | Options     |
| ------------------- | -----------| ----------- |
| postal_code         | string     | null: false |
| state               | text       | null: false |
| city                | string     | null: false |
| street              | string     | null: false |
| building_name       | string     |             |
| phone               | string     | null: false |

### Association

- belongs :buy

## buysテーブル

| Column              | Type       | Options                        |
| ------------------- | -----------| ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association

- belongs :user
- belongs :address
- has_one :item