FactoryBot.define do
  factory :receipt do
    name "MyString"
    currency %w[EUR USD PLN].sample
    amount "9.99"
    group
  end
end
