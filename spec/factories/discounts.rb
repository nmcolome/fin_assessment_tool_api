FactoryGirl.define do
  factory :discount do
    sale
    account "0123456789"
    description "2x1"
    amount 100.67
    transaction_date "2017/09/14"
  end
end