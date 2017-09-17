class Api::V1::DashboardByClusterAndProductController < ApplicationController
  def index
    render json: Sale.get_dash_by_cluster_and_product, each_serializer: DashboardByClusterAndProductSerializer
  end
end