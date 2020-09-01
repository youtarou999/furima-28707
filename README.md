# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------  | ------ | ----------- |
| name              | string | null: false |
| email     　　　   | string | null: false |
| Password     　　　| string | null: false |
| family_name       | string  | null: false |
| first_name        | string  | null: false |
| family_name_kana  | string  | null: false |
| first_name_kana   | string  | null: false |
| birthday          | string  | null: false |

### Association

-has_many :items
-has_many :comments

## items テーブル

| Column            | Type    | Options     |
| ----------------  | ------  | ----------- |
| name              | string  | null: false |
| introduction      | text    | null: false |
| price             | string  | null: false |
| seller            | string  | null: false |

### Association

-belongs_to :user
-has_many :comments


## comments テーブル

| Column            | Type    | Options                       |
| ----------------  | ------  | ----------------------------  |
| comment_text      | string  | null: false                   |
| item_id           | integer | null: false                   |
| user_id           | string  | null: false, foreign_key: true|

### Association

-belongs_to :user
-belongs_to :item

## buyers テーブル

| Column            | Type    | Options     |
| ----------------  | ------  | ----------- |


### Association

-has_one :destination
-has_one :credit_card

## destinations テーブル

| Column            | Type    | Options                        |
| ----------------  | ------  | -----------------------------  |
| postal_code       | string  | null: false                    |
| prefecture_code   | string  | null: false                    |
| city              | string  | null: false                    |
| house_number      | string  | null: false                    |
| building_name     | string  |                                |
| phone_number      | string  | null: false                    |
| buyer_id          | string  | null: false, foreign_key: true |

### Association

-belongs_to :buyer

## credit_cards テーブル

| Column            | Type    | Options                       |
| ----------------  | ------  | ----------------------------  |
| card_number       | string  | null: false                   |
| expiration_day    | string  | null: false                   |
| security_number   | string  | null: false                   |
| buyer_id          | string  | null: false, foreign_key: true|

### Association

-belongs_to :buyer

