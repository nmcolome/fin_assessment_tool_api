FactoryGirl.define do
  factory :client do
    sequence(:name) { |n| "Client#{n}" }
    client_cluster
    region
  end
end