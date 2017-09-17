class Api::V1::DashboardController < ApplicationController
  def index
    if params[:region]
      render json: Sale.get_dashboard_by_region(params[:region].capitalize), each_serializer: DashboardSerializer
    else
      render json: Sale.get_dashboard, each_serializer: DashboardSerializer
    end
  end
end