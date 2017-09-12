FactoryGirl.define do
  factory :sale do
    client
    region_product
    amount 1234.56
  end
end