class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :municipality,:building_name, :phone_number, :furima_id, :user_id
  # 2つのテーブルのバリデーションを書く
  with_options presence: true do
   validates :city
   validates :municipality
   validates :building_name
  end

  with_options presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"} do
   validates :postal_code
  end

  with_options presence: true, format: {with: /\A[a-zA-Z0-9]+\z/} do
   validates :phone_number
  end

  with_options presence: true, numericality: { other_than: 1 }  do
   validates :prefecture_id
  end

  def save
    # 各テーブルにデータを保存する処理を書く。割り振るための記述をする(テーブル間の関係性を記述すれば、アソシエーションを定義しなくても保存される。)
     purchase = Purchase.create(user_id: user_id, furima_id: furima_id)
     Profile.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, municipality: municipality, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end