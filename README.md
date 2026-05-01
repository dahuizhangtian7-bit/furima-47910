## usersテーブル
|Column            |Type    |Options    |
|------------------|--------|-----------|
|nickname          |string  |null: false|
|email             |string  |null: false, unique: true|
|encrypted_password|string  |null: false|
|family_name       |string  |null: false|
|first_name        |string  |null: false|
|kana_family_name  |string  |null: false|
|kana_first_name   |string  |null: false|
|birthday          |date    |null: false|

### Association
- has_many :items
- has_many :purchases


## itemsテーブル
|Column     |Type   |Options    |
|-----------|-------|-----------|
|name       |string |null: false|
|content    |text   |null: false|
|category_id|integer|null: false|
|status_id  |integer|null: false|
|cost_id    |integer|null: false|
|area_id    |integer|null: false|
|day_id     |integer|null: false|
|price      |integer|null: false|

### Association
- belongs_to :user
- has_one :purchase


## purchasesテーブル
|Column |Type      |Options                       |
|-------|----------|------------------------------|
|user   |references|null: false, foreign_key: true|
|item   |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル
|Column      |Type   |Options    |
|------------|-------|-----------|
|postal      |string |null: false|
|area_id     |integer|null: false|
|city        |string |null: false|
|street      |string |null: false|
|building    |string |           |
|phone_number|string |null: false|

### Association
- belongs_to :purchase