class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input half-width characters."} do
    validates :first_name
    validates :last_name
  end
    
  with_options presence: true,format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."} do
    validates :first_name_kana
    validates :last_name_kana
  end
  
  with_options presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input half-width characters."} do
    validates :password
  end

    validates :birth_day, presence: true
    validates :nickname, presence: true

    has_many :furimas
    has_many :purchases

end