class Client < ApplicationRecord
  belongs_to :client_cluster
  belongs_to :region
  has_many :sales, dependent: :destroy
end
