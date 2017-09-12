require 'rails_helper'

RSpec.describe ClientCluster, type: :model do
  describe "attributes" do
    it { is_expected.to respond_to :name }
  end
end
