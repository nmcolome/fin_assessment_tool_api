require 'rails_helper'

RSpec.describe Client, type: :model do
  describe "attributes" do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :client_cluster_id }
    it { is_expected.to respond_to :region_id }
  end

  describe "relationships" do
    it { should belong_to(:client_cluster) }
    it { should belong_to(:region) }
    it { should have_many(:sales) }
  end
end
