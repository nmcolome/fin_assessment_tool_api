require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "attributes" do
    it do
      is_expected.to respond_to :name
    end
  end
end
