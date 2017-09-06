# README

## usersテーブル

|Column|T_manyype|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|

### Association
- has_many :messages
- has_many :groups, through: :group_users
- has_many :group_users

## groupsテーブル

|Column|T_manyype|Options|
|------|----|-------|
|user_id|integer|null: false, add_index: foreign_key: true|


### Association
- has_many :users, throuth: :group_users
- has_many :group_users
- has_many :massages

## messagesテーブル

|Column|T_manyype|Options|
|------|----|-------|
|user_id|integer|
|group_id|integer|
|body|string|
|images|string|

### Association
- belongs_to :user
- belongs_to :group

## group_userテーブル

|Column|T_manyype|Options|
|------|----|-------|
|user_id|integer|null: false, add_index: foreign_key: true|
|group_id|integer|null: false, add_index: foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group
