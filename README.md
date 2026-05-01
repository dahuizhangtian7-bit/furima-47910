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
|birthday          |datetime|null: false|

### Association
- has_many :items
- has_many :purchases


## itemsテーブル
|Column  |Type   |Options    |
|--------|-------|-----------|
|image   |text   |null: false|
|name    |string |null: false|
|content |text   |null: false|
|category|string |null: false|
|status  |string |null: false|
|cost    |string |null: false|
|area    |string |null: false|
|days    |string |null: false|
|price   |integer|null: false|

### Association
- belongs_to :users
- has_one :purchase


## purchasesテーブル
|Column |Type      |Options                       |
|-------|----------|------------------------------|
|user   |references|null: false, foreign_key: true|
|item   |references|null: false, foreign_key: true|
|address|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル
|Column      |Type   |Options    |
|------------|-------|-----------|
|postal      |integer|null: false|
|prefecture  |string |null: false|
|city        |string |null: false|
|street      |string |null: false|
|building    |string |           |
|phone_number|integer|null: false|

### Association
- belongs_to :purchase