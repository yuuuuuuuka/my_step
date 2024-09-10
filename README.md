# アプリケーション名 
my_step

# URL


## User名

| Column               | Type   | Options     |
| ------------------   | ------ | ----------- |
| name                 | string | null: false |
| email                | string | null: false,unique: true |
| encrypted_password   | string | null: false | 
 has many :logs
 has_one :profile,dependent: :destroy

## profileテーブル
| Column               | Type       | Options     |
| -----------------    | ------     | ----------- |
| user                 | references | null: false, foreign_key: true |
| height               | int        | null: false |
| weight               | int        | null: false |
| goal_weight          | int        | null: false |
belongs_to :user
 



##　Logsテーブル

| Column         | Type       | Options                        |
| ------         | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| name           | string     | null: false                    |
| date           |  date      | null: false                    |
| duration       | int        | null: false, greater_than_or_equal_to: 0 |
| reps           | int        | null: false, greater_than:0    |           
| memo           | text       |                                |

belongs_to:user





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
