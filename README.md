# README

## users

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| name               | string  | null: false |
| name_reading       | string  | null: false |
| birthday           | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | string     | null: false                    |
| item_name    | string     | null: false                    |
| explanation  | text       | null: false                    |
| category     | string     | null: false                    |
| condition    | string     | null: false                    |
| delivery_fee | string     | null: false                    |
| ship_from    | string     | null: false                    |
| days_to_ship | string     | null: false                    |
| price        | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

# orders

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| purchaser  | string     | null: false                    |
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |
| address_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| postal_code      | integer | null: false |
| prefecture       | string  | null: false |
| city             | string  | null: false |
| house_number     | string  | null: false |
| building_name    | string  |             |
| telephone_number | integer | null: false |

### Association

- belongs_to :order
