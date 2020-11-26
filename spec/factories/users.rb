FactoryBot.define do
  factory :user do
  password               {"0000aaa"}
  password_confirmation  {"0000aaa"}
  nickname               {"test"}
  email                  {"test@sample"}
  first_name             {"あア亜"}
  first_name_kana        {"カタカナ"}
  last_name              {"あア亜"}
  last_name_kana         {"カタカナ"}
  birth_date             { Date.today }
end
end