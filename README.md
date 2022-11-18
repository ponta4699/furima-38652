# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false, unique: true |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_date(1i)     | datetime            | null: false               |
| birth_date(2i)     | datetime            | null: false               |
| birth_date(3i)     | datetime            | null: false               |



### Association

* has_many :items
* has_many :comments

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| info                                | text       | null: false                    |
| category_id                         | string     | null: false                    |
| sales_status_id                     | string     | null: false                    |
| shipping_fee_status_id              | string     | null: false                    |
| prefecture_id                       | string     | null: false                    |
| scheduled_delivery_id               | string     | null: false                    |
| price                               | integer    | null: false                    |



### Association

- belongs_to :user
- has_many :comments

## comments table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| content     | text       | null: false                    |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user




## users table

has_one :oder


### Association


## oders table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| postal_code                         | string     | null: false                    |
| prefecture                          | integer    | null: false                    |
| city                                | string     | null: false                    |
| house_number                        | string     | null: false                    |
| building_name                       | string     |                                |
| phone_number                        | string     | null: false                    |
| item                                | references | null: false, foreign_key: true |
| user                                | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item


## items table

### Association

has_one :oder