class Purchase < ApplicationRecord
  belongs_to :furima
  belongs_to :user
  has_one :profile
  
end
