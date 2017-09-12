require 'rails_helper'

RSpec.describe Region, type: :model do
  describe "attributes" do
    it { is_expected.to respond_to :name }
  end

  describe "relationships" do
    it { should have_many(:clients) }
  end
end
