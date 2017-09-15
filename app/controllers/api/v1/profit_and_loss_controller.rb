class Api::V1::ProfitAndLossController < ApplicationController
  def index
    render json: Sale.get_profit_and_loss
  end
end