FactoryBot.define do
  factory :contributor do
    user
    association :receipt, currency: "EUR"
    debt 15
  end
end
