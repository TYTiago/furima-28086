FactoryBot.define do
  factory :order do
    postal                 {'000-0000'}
    municipality           {"ああああ"}
    address                {"ああああ"}
    building               {"ああああ"}
    phone_number           {12345678912}
    prefecture_id          {2}
    purchase_record_id     {1}
    token {"tok_abcdefghijk00000000000000000"}
  end
end