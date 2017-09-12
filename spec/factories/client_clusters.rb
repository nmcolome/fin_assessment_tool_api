FactoryGirl.define do
  factory :client_cluster do
    sequence(:name) { |n| "ClientCluster#{n}" }
  end
end