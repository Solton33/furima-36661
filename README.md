# README

## Users

|Column             |Type       |Options                         |
|------------------ |---------- |------------------------------- |
|nickname           |string     |null: false                     |
|email              |string     |null: false                     |
|password           |references |null: false, foreign_key: true  |
|encrypted_password |references |null: false, foreign_key: true  |
|last_name          |string     |null: false                     |
|first_name         |string     |null: false                     |
|last_name_kana     |string     |null: false                     |
|first_name_kana    |string     |null: false                     |
|birth              |date       |null: false                     |


## Association

- has_many :items
- has_many :orders

## Items

|Column           |Type       |Options                        |
|---------------- |---------- |------------------------------ |
|item_name        |string     |null: false                    |
|price            |integer    |null: false                    |
|item_text        |text       |null: false                    |
|category_id      |integer    |null: false                    |
|status_id        |integer    |null: false                    |
|delivery_fee_id  |integer    |null: false                    |
|prefectures_id   |integer    |null: false                    |
|shipping_date_id |integer    |null: false                    |
|user             |references |null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one :order

## Orders

|Column|Type       |Options                        |
|----- |---------- |------------------------------ |
|user  |references |null: false, foreign_key: true |
|item  |references |null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :address


## Address

|Column         |Type         |Options                      |
|-------------- |---------- |------------------------------ |
|postal_code    |string     |null: false                    |
|prefectures_id |integer    |null: false                    |
|municipality   |text       |null: false                    |
|address        |text       |null: false                    |
|building       |text       |                               |
|phone_number   |string     |null: false                    |
|order          |references |null: false, foreign_key: true |

## Association

- belongs_to :order