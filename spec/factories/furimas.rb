FactoryBot.define do
  factory :furima do
    association :user

    name                     {"aaaaaa"}
    description              {"aaaaaa"}
    category_id              {2}
    status_id                {2}
    delivery_charge_id       {2}
    prefectures_id           {2}
    delivery_day_id          {2}
    price                    {300}
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

