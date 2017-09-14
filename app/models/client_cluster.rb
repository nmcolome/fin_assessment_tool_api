class ClientCluster < ApplicationRecord
  has_many :clients, dependent: :destroy
end
