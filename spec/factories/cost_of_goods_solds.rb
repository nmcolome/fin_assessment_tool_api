FactoryGirl.define do
  factory :cost_of_goods_sold do
    sale
    account "0123456789"
    description "Raw Materials"
    amount 1234.56
  end
end