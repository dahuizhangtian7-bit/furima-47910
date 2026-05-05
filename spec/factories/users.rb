FactoryBot.define do
  factory :user do
    nickname { 'たろう' }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name { '山田' }
    first_name { '太郎' }
    kana_family_name { 'ヤマダ' }
    kana_first_name { 'タロウ' }
    birthday { Date.new(1990, 1, 1) }
  end
end
