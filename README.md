# README

## usersテーブル

|Column|T_manyype|Options|
|------|----|-------|
|user_id|integer|null: false, add_index: foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|

### Association
- belongs_to :group
- has_many :messages
- has_many :groups, through: :group_users
- has_many :group_users

## groupsテーブル

|Column|T_manyype|Options|
|------|----|-------|
|user_id|integer|null: false, add_index: foreign_key: true|
|group_id|integer|null: false, add_index: foreign_key: true|


### Association
- has_many :users, throuth: :group_users
- has_many :group_users

## messagesテーブル

|Column|T_manyype|Options|
|------|----|-------|
|user_id|integer|
|group_id|integer|
|text|string|
|images|string|

### Association
- belongs_to :user

## group_userテーブル

|Column|T_manyype|Options|
|------|----|-------|
|user_id|integer|null: false, add_index: foreign_key: true|
|group_id|integer|null: false, add_index: foreign_key: true|
|name|string|null: false, add_index: foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group
