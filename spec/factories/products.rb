FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Product#{n}"}
    category
  end
end