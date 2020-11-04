class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :municipality,:building_name, :phone_number, :furima_id, :user_id, :token
  # 2つのテーブルのバリデーションを書く
  with_options presence: true do
   validates :city
   validates :municipality
   validates :token
   validates :postal_code
   validates :phone_number
   validates :prefecture_id
  end

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone_number, format: {with: /\A[a-zA-Z0-9]+\z/}
  validates :phone_number, length: { maximum: 11, message: 'Too long' }
  validates :prefecture_id, numericality: { other_than: 1 } 

  def save
    # 各テーブルにデータを保存する処理を書く。割り振るための記述をする(テーブル間の関係性を記述すれば、アソシエーションを定義しなくても保存される。)
     purchase = Purchase.create(user_id: user_id, furima_id: furima_id)
     Profile.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, municipality: municipality, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end