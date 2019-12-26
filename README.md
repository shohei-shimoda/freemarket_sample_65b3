# README

# メルカリ
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|text|null: false, unique: true|
|e-mail|integer|null: false, unique: true|
|password|integer|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
|phone_num|integer|null: false|
|authentication_num|integer|null: false|
|user_img|text||
|introduction|text||

### Association
- has_one :address, dependent: :destroy
- has_one :card
- has_many :items
- has_many :comments
- has_many :likes

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|postcode|integer|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|house_num|integer|null: false|
|buiding_name|string||
|phone_num|integer|null: false|

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_num|integer|null: false|
|limit_month|integer|null: false|
|limit_year|integer|null: false|
|security_code|integer|null: false|

### Association
- belongs_to :user

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|
|description|text|null: false|
|condition|integer|null: false|
|category_id|references|null: false, foreign_key: true|
|size|integer|null: false|
|brand|integer||
|delivery_charge|integer|null: false|
|delivery_area|integer|null: false|
|delivery_days|integer|null: false|
|price|integer|null: false|
|status|integer|null: false|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|
|image_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
- belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
- belongs_to :category
- has_many :comments
- has_many :images
- has_many :likes

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|text|null: false|

### Association
- belongs_to :item

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## likeテーブル

Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## categoriesテーブル

Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :items

## prefectureテーブル

Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :addresses
