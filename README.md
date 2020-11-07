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
| email    | string | null: false,|

### Association

- has_many :goods
- has_many :Purchase record


## goods テーブル

| Column      | Type    | Options                        |
| ------      | ------  | -----------                    |
| title       | string  | null: false                    |
| saler_id    | integer | null: false, foreign_key: true |
| goods-id    | integer | null: false, unique: true      |
| price       | integer | null: false                    |
| description | text    | null: false                    |
| image_url   | text    | null: false                    |
| date        | text    | null: false                    |
| maker       | text    | null: false                    |
| category    | text    | null: false                    |
### Association

  belongs_to :users
  belongs_to :Purchase record

