class Api::V1::TransactionsController < ApplicationController
  def index
    @transaction = current_user.transactions.order(id: :desc).includes([:asset])

    render json: @transaction
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.asset_id = params[:asset_id]

    if @transaction.save
      Asset.update_amount(@transaction)

      render json: @transaction
    end
  end

  private
  def transaction_params
    params.require(:transaction).permit(:title, :amount, :time)
  end
end
