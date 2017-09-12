FactoryGirl.define do
  factory :discount do
    sale
    account "0123456789"
    description "2x1"
    amount 1234.56
  end
end