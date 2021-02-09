require 'net/http'
require 'nokogiri'

class Api::V1::TransactionsController < ApplicationController
  def index
    @transaction = current_user.transactions.order(id: :desc).includes([:asset])

    stock_amount = 0

    @transaction.each do |t|
      if t.asset.category == 'stock'
        t.title = "#{t.title} #{t.amount.to_i}주"
        res = Net::HTTP.get_response(URI.parse("http://asp1.krx.co.kr/servlet/krx.asp.XMLSise?code=#{t.stock_code}"))
        m = res.body.match(/day_EndPrice="(\S+)"/)[1].gsub!(/\,/, "")
        t.amount = m.to_f * t.amount
        stock_amount += t.amount
      end
    end

    Asset.update_stock_amount(current_user.assets.find_by(category: 'stock').id, stock_amount)

    render json: @transaction
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.asset_id = params[:asset_id]

    if @transaction.save
      Asset.update_amount(@transaction) unless @transaction.asset.category == 'stock'

      render json: @transaction
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.amount = @transaction.amount * (-1)

    if @transaction.destroy
      Asset.update_amount(@transaction) unless @transaction.asset.category == 'stock'
      render json: { msg: "transaction deleted" }
    else
      render json: { msg: "transaction delete failed" }, status: 404
    end

  end

  private
  def transaction_params
    params.require(:transaction).permit(:title, :amount, :time, :stock_code)
  end
end
