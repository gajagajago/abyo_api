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

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.amount = @transaction.amount * (-1)

    if @transaction.destroy
      Asset.update_amount(@transaction)
      render json: { msg: "transaction deleted" }
    else
      render json: { msg: "transaction delete failed" }, status: 404
    end

  end

  private
  def transaction_params
    params.require(:transaction).permit(:title, :amount, :time)
  end
end
