## usersテーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| nickname           | string   | null: false               |
| birthday           | datetime | null: false               |
| family_name        | string   | null: false               |
| first_name         | string   | null: false               |
| family_name_kana   | string   | null: false               |
| first_name_kana    | string   | null: false               |

### Association
- has_many :products
- has_many :comments
- has_many :likes
- has_many :cards
- has_many :deliver_address


## productsテーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| name            | string     | null: false                   |
| price           | integer    | null: false                   |
| shipping_cost   | integer    | null: false                   |
| condition       | string     | null: false                   |
| ship_from       | string     | null: false                   |
| ship_date       | string     | null: false                   |
| introduction    | text       | null: false                   |
| sell_user_id    | references | null: false, foreign_key:true |
| buy_user_id     | references | foreign_key:true              |
| brand           | references | foreign_key:true              |
| category        | references | null: false, foreign_key:true |

### Association
- belongs_to :user
- has_many :comments
- has_many :likes
- belongs_to :brand
- belongs_to :category


## deliver_addressテーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| postcode         | integer    | null: false                   |
| prefecture       | string     | null: false                   |
| municipality     | string     | null: false                   |
| address          | string     | null: false                   |
| building_name    | string     |                               |
| telephone_number | integer    | null: false                   |
| user             | references | null: false, foreign_key:true |


### Association
- belongs_to :user


## cardsテーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| card   | integer    | null: false                   |
| user   | references | null: false, foreign_key:true |


### Association
- belongs_to :user


## comementsテーブル

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


## brandsテーブル

| Column       | Type   | Options |
| ------------ | ------ | ------- |
| brand_name   | string |         |


### Association
- has_many :product



## categoriesテーブル

| Column          | Type   | Options    |
| --------------- | ------ | ---------- |
| category_name   | string | null:false |


### Association
- has_many :product
