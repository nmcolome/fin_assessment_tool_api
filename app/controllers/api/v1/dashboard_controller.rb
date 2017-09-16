class Api::V1::DashboardController < ApplicationController
  def index
    render json: Sale.get_dashboard, each_serializer: DashboardSerializer
  end
end