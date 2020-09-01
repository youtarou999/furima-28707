# テーブル設計

## users テーブル

| Column            | Type    | Options     |
| ----------------  | ------  | ----------- |
| name              | string  | null: false |
| email     　　　   | string  | null: false |
| Password     　　　| string  | null: false |
| family_name       | string  | null: false |
| first_name        | string  | null: false |
| family_name_kana  | string  | null: false |
| first_name_kana   | string  | null: false |
| birthday          | date    | null: false |


### Association

-has_many :items
-has_many :comments
-has_many :transactions

## items テーブル

| Column            | Type    | Options                       |
| ----------------  | ------  | ----------------------------- |
| name              | string  | null: false                   |
| introduction      | text    | null: false                   |
| price             | integer | null: false                   |
| image             | string  | null: false                   |
| user_id           | integer | null: false, foreign_key: true|

### Association

-belongs_to :user
-has_many :comments
-has_one :transaction


## comments テーブル

| Column            | Type    | Options                       |
| ----------------  | ------  | ----------------------------  |
| comment_text      | string  | null: false                   |
| item_id           | integer | null: false  foreign_key: true|
| user_id           | integer | null: false, foreign_key: true|

### Association

-belongs_to :user
-belongs_to :item

## transactions テーブル

| Column            | Type    | Options                       |
| ----------------  | ------  | ----------------------------  |
| item_id           | integer | null: false  foreign_key: true|
| user_id           | integer | null: false  foreign_key: true|

### Association

-has_one :destination
-belong_to :user
-belong_to :item


## destinations テーブル

| Column            | Type    | Options                        |
| ----------------  | ------  | -----------------------------  |
| postal_code       | string  | null: false                    |
| city              | string  | null: false                    |
| house_number      | string  | null: false                    |
| building_name     | string  |                                |
| phone_number      | string  | null: false                    |
| transaction_id    | integer | null: false, foreign_key: true |

### Association

-belongs_to :transaction

<!-- ここからはActiveHash用のテーブルです  -->

## prefectures　

| Column            | Type    | Options                        |
| ----------------  | ------  | -----------------------------  |
| title             | string  | null: false                    |
| text              |  text   | null: false                    |
| prefecture_id     | integer | null: false                    |

## categories 

| Column            | Type    | Options                        |
| ----------------  | ------  | -----------------------------  |
| title             | string  | null: false                    |
| text              |  text   | null: false                    |
| category_id       | integer | null: false                    |

## products_condition

| Column               | Type    | Options                        |
| -------------------  | ------  | -----------------------------  |
| title                | string  | null: false                    |
| text                 |  text   | null: false                    |
| product_condition_id | integer | null: false                    |

## postage_payer

| Column            | Type    | Options                        |
| ----------------  | ------  | -----------------------------  |
| title             | string  | null: false                    |
| text              |  text   | null: false                    |
| postage_payer_id  | integer | null: false                    |

## preparation_day

| Column              | Type    | Options                        |
| ------------------  | ------  | -----------------------------  |
| title               | string  | null: false                    |
| text                |  text   | null: false                    |
| preparation_day_id  | integer | null: false                    |

