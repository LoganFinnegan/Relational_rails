class CustomerOrdersController < ApplicationController
  def index
    @customer = Customer.find(params[:id])
    @customer_orders = @customer.orders
  end

  def new
    @customer = Customer.find(params[:id])
  end

  def create
    customer = Customer.find(params[:id])
    new_order = customer.orders.create!(customer_order_params)
    redirect_to "/customers/#{customer.id}/orders"
  end

  private

  def customer_order_params
    params.permit(:item_name, :model, :shipped)
  end
end