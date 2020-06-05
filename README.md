# README

## usersテーブル

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
|profile_image|text||
|profile_text|text||
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|

### Association
- has_many :messages
- has_many :stores
- has_many :group_users
- has_many :groups, through: :group_users


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|user|integer|foreign_key: true|
|group|integer|foreign_key: true|
|text|text||
|image|text||

### Association
- belongs_to :group
- belongs_to :user

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|group_name|string|null: false, unique: true|
|group_owner|string|null: false|
|detail|text|null: false|

### Association
- has_many :messages
- has_many :group_users
- has_many :users, through: :group_users

## group_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user|integer|foreign_key: true|
|group|integer|foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## storesテーブル
|Column|Type|Options|
|------|----|-------|
|user|integer|foreign_key: true|
|store_name|string|null: false|
|store_image|text||
|store_detail|text||
|store_phone|string|null: false|
|store_email|string|null: false|

### Association
- belongs_to :user
