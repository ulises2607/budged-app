FactoryBot.define do
  factory :payment do
    name { Faker::Name.name }
    amount { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    association :author, factory: :user
  end
end
