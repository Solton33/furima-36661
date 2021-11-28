# README

## Users

|Column             |Type       |Options                         |
|------------------ |---------- |------------------------------- |
|nickname           |string     |null: false                     |
|email              |string     |null: false                     |
|password           |references |null: false, foreign_key: true  |
|encrypted_password |references |null: false, foreign_key: true  |

## Association

- has_many :items
- has_many :orders

## Items

|Column    |Type       |Options                        |
|--------- |---------- |------------------------------ |
|image     |text       |null: false                    |
|item_name |string     |null: false                    |
|category  |text       |null: false                    |
|price     |string     |null: false                    |
|status    |text       |null: false                    |
|text      |text       |null: false                    |
|source    |string     |null: false                    |
|user      |references |null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one :order

## Orders

|Column|Type   |Options                        |
|----- |------ |------------------------------ |
|user  |string |null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :items
- has_one :address


## Address
|Column       |Type       |Options                        |
|------------ |---------- |------------------------------ |
|postal_code  |integer    |null: false                    |
|prefectures  |text       |null: false                    |
|municipality |text       |null: false                    |
|address      |text       |null: false                    |
|building     |text       |                               |
|phone_number |integer    |null: false                    |
|order        |references |null: false, foreign_key: true |

## Association

- belongs_to :order