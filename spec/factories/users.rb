FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 10) }
    password_confirmation { password }
    first_name            { '宏俊' }
    last_name             { '中本' }
    first_name_kana       { 'ヒロトシ' }
    last_name_kana        { 'ナカモト' }
    birth_date              { '1900-01-01' }
  end
end