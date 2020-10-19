# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| first_name         | string              | null: false             |
| family_name        | string              | null: false             |
| first_name_kana    | string              | null: false             |
| family_name_kana   | string              | null: false             |
| birth_day          | date                | null: false             |

### Association

* has_many :item
* has_many :comment
* belongs_to :purchase

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| description                         | text       | null: false       |
| category                            | integer    | null: false       |
| status                              | integer    | null: false       |
| delivery_charge                     | text       | null: false       |
| delivery_area                       | integer    | null: false       |
| delivery_day                        | integer    | null: false       |
| price                               | integer    | null: false       |

### Association
- belongs_to :purchase
- belongs_to :user
- has_many :comment

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| item_id     | references | foreign_key: true |
| user_id     | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## purchases table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :profile

## profile table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postal_code        | string              | null: false             |
| prefectures        | string              | null: false             |
| city               | string              | null: false             |
| municipality       | string              | null: false             |
| building_name      | string              |             |
| phone_number       | string              | null: false             |
| item_id            | string              | null: false             |

### Association

- belongs_to :purchase