class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    kanaall = "\A[ぁ-んァ-ン一-龥]"
    katakana = "\A[ァ-ヶー－]+\z"
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input half-width characters."}
  validates :first_name, format: { with: /#{kanaall}/, message: "is invalid. Input half-width characters."}
  validates :last_name, format: { with: /#{kanaall}/, message: "is invalid. Input half-width characters."}
  validates :first_name_kana, format: { with: /#{katakana}/, message: "is invalid. Input full-width katakana characters."}
  validates :last_name_kana, format: { with: /#{katakana}/, message: "is invalid. Input full-width katakana characters."}
  validates :birth_day
  end

end
