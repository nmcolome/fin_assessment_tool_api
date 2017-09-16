class Api::V1::ProfitAndLossController < ApplicationController
  def index
    render json: Sale.get_profit_and_loss, each_serializer: ProfitAndLossSerializer
  end
end