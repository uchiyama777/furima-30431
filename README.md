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
| birth_day          | text                | null: false             |

### Association

* has_many :items
* has_many :comments
* belongs_to :purchases

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| image                               | string     | null: false       |
| name                                | string     | null: false       |
| description                         | text       | null: false       |
| category                            | integer    | null: false       |
| status                              | integer    | null: false       |
| price                               | integer    | null: false       |

### Association

- belongs_to :user
- has_many :comments

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| item_id     | references | foreign_key: true |
| user_id     | references | foreign_key: true |

### Association

- belongs_to :items
- belongs_to :user

## purchases table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :items
- belongs_to :user
- has_one :profile

## profile table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postal_code        | string              | null: false             |
| city               | string              | null: false             |
| adress1            | string              | null: false             |
| adress2            | string              | null: false             |
| building_name      | string              | null: false             |
| phone_number       | string              | null: false             |
| user_id            | string              | null: false             |

### Association

- belongs_to :purchases