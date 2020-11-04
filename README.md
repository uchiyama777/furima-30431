# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| first_name_kana    | string              | null: false             |
| last_name_kana     | string              | null: false             |
| birth_day          | date                | null: false             |

### Association

* has_many :furimas
* has_many :comments
* has_many :purchases

## furimas table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| user                                | references | null: false       |
| description                         | text       | null: false       |
| category_id                         | integer    | null: false       |
| status_id                           | integer    | null: false       |
| delivery_charge_id                  | integer    | null: false       |
| prefecture_id                       | integer    | null: false       |
| delivery_day_id                     | integer    | null: false       |
| price                               | integer    | null: false       |

### Association
- belongs_to :user
- has_one :comments
- has_one :purchase

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| furima_id   | references | foreign_key: true |
| user_id     | references | foreign_key: true |

### Association

- belongs_to :furima
- belongs_to :user

## purchases table　(form objet割り振り先)

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| furima      | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :furima
- belongs_to :user
- has_one :profile

## profile table　　(form objet割り振り先)

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postal_code        | string              | null: false             |
| prefecture_id      | integer             | null: false             |
| city               | string              | null: false             |
| municipality       | string              | null: false             |
| building_name      | string              |                         |
| phone_number       | string              | null: false             |
| purchase           | references          | foreign_key: true       |

### Association

- belongs_to :purchase

