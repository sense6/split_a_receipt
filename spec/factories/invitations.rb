FactoryBot.define do
  factory :invitation do
    association :sender, factory: :user
    association :receiver, factory: :user
    group
  end
end
