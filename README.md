## usersテーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| nickname           | string   | null: false               |
| birthday           | date     | null: false               |
| family_name        | string   | null: false               |
| first_name         | string   | null: false               |
| family_name_kana   | string   | null: false               |
| first_name_kana    | string   | null: false               |

### Association
- has_many :products
- has_many :comments
- has_many :likes
- has_many :orders


## productsテーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| name             | string     | null: false                   |
| price            | integer    | null: false                   |
| shipping_cost_id | integer    | null: false                   |
| condition_id     | integer    | null: false                   |
| area_id          | integer    | null: false                   |
| ship_date_id     | integer    | null: false                   |
| introduction     | text       | null: false                   |
| user             | references | null: false, foreign_key:true |
| category_id      | integer    | null: false                   |

### Association
- belongs_to :user
- has_many :comments
- has_many :likes
- has_one :order


## addressesテーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| postcode         | string     | null: false                   |
| area_id          | integer    | null: false                   |
| municipality     | string     | null: false                   |
| house_number     | string     | null: false                   |
| building_name    | string     |                               |
| telephone_number | string     | null: false                   |
| order            | references | null: false, foreign_key:true |


### Association
- belongs_to :order

## ordersテーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| product | references | null: false, foreign_key:true |
| user    | references | null: false, foreign_key:true |


### Association
- belongs_to :product
- belongs_to :user
- has_one: address



## commentsテーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| content | text       | null: false                   |
| user    | references | null: false, foreign_key:true |
| product | references | null: false, foreign_key:true |


### Association
- belongs_to :user
- belongs_to :product


## likesテーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| like    | boolean    |                               |
| user    | references | null: false, foreign_key:true |
| product | references | null: false, foreign_key:true |


### Association
- belongs_to :user
- belongs_to :product



