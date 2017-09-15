FactoryGirl.define do
  factory :cost_of_goods_sold do
    sale
    account "0123456789"
    description "Raw Materials"
    amount 234.56
    transaction_date "2017/09/14"
  end
end