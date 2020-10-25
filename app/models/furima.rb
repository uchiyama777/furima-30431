class Furima < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day

  #空の投稿を保存できないようにする
  with_options presence: true do
   validates :image
   validates :name 
   validates :description 
   validates :category
   validates :status
   validates :delivery_charge 
   validates :prefectures_id 
   validates :delivery_day
   validates :price
  end

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :delivery_charge_id 
  validates :prefectures_id
  validates :delivery_day_id 
  end

  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9999999 }

  has_one_attached :image
  belongs_to :user
  has_one :purchase
  
end
