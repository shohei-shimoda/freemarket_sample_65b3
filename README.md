# README

# メルカリ
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
|phone_num|integer|null: false|
|user_img|text||
|introduction|text||

### Association
- has_one :address, dependent: :destroy
- has_one :card
- has_many :items
- has_many :comments
- has_many :likes
- has_many :sns_credentials, dependent: :destroy

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
|postcode|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|house_num|string|null: false|
|building_name|string||
|address_phone_num|string||

### Association
- belongs_to :user, optional: true
- belongs_to_active_hash :prefecture

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user, optional: true

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|
|description|text|null: false|
|condition|integer|null: false|
|category_id|references|null: false|
|child_category|integer|
|grandchild_category|integer|
|size|integer||
|brand|integer||
|delivery_charge|integer|null: false|
|delivery_area|integer|null: false|
|delivery_days|integer|null: false|
|price|integer|null: false|
|status|integer|null: false,default: 0|
|seller_id|integer||
|buyer_id|integer||
|image_id|integer||

### Association
- belongs_to :seller, class_name: 'User'
- belongs_to :buyer, class_name: 'User'
- belongs_to :category
- has_many :comments, dependent: :destroy
- has_many :images, dependent: :destroy
- has_many :likes

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|src|string||

### Association
- belongs_to :item

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text||
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
- has_many :items, dependent: :destroy

## sns_credentialsテーブル

Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|provider|string||
|uid|string||

### Association
- belongs_to :user, optional: true
