class Api::V1::TopCustomersController < ApplicationController
  def index
    render json: Client.get_top_customers, each_serializer: TopCustomersSerializer
  end
end