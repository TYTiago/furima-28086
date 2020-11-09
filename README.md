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

| Column                | Type   | Options        |
| --------              | ------ | -----------    |
| email                 | string | null: false    |
| nickname              | string | null: false    |
| encrypted_password    | string | null: false    |
| first_name            | string | null: false    |
| last_name             | string | null: false    |
| first_name_kana       | string | null: false    |
| last_name_kana        | string | null: false    |
| birth_date            | date   | null: false    |

### Association

- has_many :goods
- has_many :purchase_records

## goods テーブル
| Column         | Type    | Options                        |
| ------         | ------  | -----------                    |
| title          | string  | null: false                    |
| user_id        | integer | null: false, foreign_key: true |
| price          | integer | null: false                    |
| date_id        | integer | null: false                    |
| description    | text    | null: false                    |
| category_id    | integer | null: false                    |
| area_id        | integer | null: false                    |
| delivery_id    | integer | null: false                    |

### Association

  belongs_to :user
  belongs_to :purchase_record
##  purchase_record テーブル

| Column        | Type    | Options                         |
| ------        | ------  | -----------                     |
| user_id       | integer | null: false, foreign_key: true  |
| good_id      | integer | null: false, foreign_key: true  |
### Association

  belongs_to :user
  has_one :street_address
  belongs_to :good

##  street_address テーブル

| Column          | Type    | Options     |
| ------          | ------  | ----------- |
| postal          | string  | null: false |
| prefectures_id  | integer | null: false |
| municipality    | string  | null: false |
| address         | string  | null: false |
| building        | string  |             |
| phone_number    | string  | null: false |

### association
belongs_to :purchase_record