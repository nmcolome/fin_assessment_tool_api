FactoryGirl.define do
  factory :operating_expense do
    sale
    account "0123456789"
    description "Administrative"
    amount 1234.56
  end
end