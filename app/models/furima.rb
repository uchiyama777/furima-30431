class Furima < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  # belongs_to_active_hash :prefectures
  # belongs_to_active_hash :delivery_day

  #空の投稿を保存できないようにする
  validates :category, presence: true
  validates :status, presence: true
  validates :delivery_charge, presence: true
  validates :prefectures, presence: true
  validates :delivery_day, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :prefectures_id, numericality: { other_than: 1 }
  validates :delivery_day_id, numericality: { other_than: 1 }

  has_one_attached :image
end
