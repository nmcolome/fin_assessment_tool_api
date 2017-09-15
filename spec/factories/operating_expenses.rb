FactoryGirl.define do
  factory :operating_expense do
    sale
    account "0123456789"
    description "Administrative"
    amount 80.56
    transaction_date "2017/09/14"
  end
end