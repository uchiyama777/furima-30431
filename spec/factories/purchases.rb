FactoryBot.define do
  factory :purchase_form do
     association :user
     association :furima
    
    postal_code         {"111-1111"}
    prefecture_id       {2}
    city                {"横浜市"}
    municipality        {"横浜"} 
    phone_number        {"09012345678"}
    token               {"tok_abcdefghijk00000000000000000"}
  end
end
