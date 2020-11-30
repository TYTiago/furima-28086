FactoryBot.define do
  factory :item do
    association :user
    title                 {'ああああ'}
    price                 {"1000"}
    description           {"いい"}
    category_id           {1}
    date_delivery_id      {1}
    area_id               {1}
    status_id             {1}
    delivery_id           {1}

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
