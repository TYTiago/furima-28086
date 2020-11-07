# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| name     | string | null: false |
| password | string | null: false |
### Association

- has_many :goods
- has_many :Purchase record

| Column         | Type    | Options                        |
| ------         | ------  | -----------                    |
| title          | string  | null: false                    |
| saler_id       | integer | null: false, foreign_key: true |
| goods-id       | integer | null: false, unique: true      |
| price          | integer | null: false                    |
| date_id        | integer | null: false                    |
| description    | text    | null: false                    |
| category_id    | integer | null: false                    |
| area_id        | integer | null: false                    |
| Delivery_id    | integer | null: false                    |

### Association

  belongs_to :users
  belongs_to :Purchase record
##  Purchase record テーブル

| Column        | Type    | Options                         |
| ------        | ------  | -----------                     |
| buyer_id      | integer | null: false, foreign_key: true  |
| goods-id      | integer | null: false                     |
### Association

  belongs_to :users
  belongs_to :Street address
  has_many :goods

##  Street address テーブル

| Column          | Type    | Options     |
| ------          | ------  | ----------- |
| postal          | integer | null: false、foreign_key: true|
| prefectures     | string  | null: false、foreign_key: true|
| Municipality    | string  | null: false、foreign_key: true|
| address         | string  | foreign_key: true             |
| Building        | string  | null: false、foreign_key: true|
| phone_number    | string  | null: false、foreign_key: true|

### Association
belongs_to :Purchase record