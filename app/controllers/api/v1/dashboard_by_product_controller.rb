class Api::V1::DashboardByProductController < ApplicationController
  def index
    render json: Sale.get_dash_by_product, each_serializer: DashboardByProductSerializer
  end
end