FactoryGirl.define do
  factory :sale do
    client
    region_product
    amount 1234.56
    transaction_date "2017/09/14"
  end
end