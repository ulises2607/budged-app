FactoryBot.define do
  factory :group_payment do
    association :group, factory: :group
    association :payment, factory: :payment
  end
end
