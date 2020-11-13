# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |

### Association
- belongs_to :comments
- belongs_to :prototypes

## comments テーブル

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| text      | text       | null: false                   |
| user      | references | null: false,foreign_key: true |
| prototype | references | null: false,foreign_key: true |

### Association

- has_many :users
- has_many :comments


## prototypes テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| title         | string     |                                |
| catch_copy    | references | null: false, foreign_key: true |
| concept       | text       | null: false,                   |
| image         |            | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- has_many :users
- belongs_to :comments