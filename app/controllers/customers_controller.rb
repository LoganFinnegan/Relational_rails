class CustomersController < ApplicationController
  def index 
    @customers = Customer.sort_by_created_date
  end

  def show
    @customer = Customer.find(params[:id])
  end
  
  def new; end

  def create
    new_customer = Customer.create!(customer_params)
    redirect_to "/customers"
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to "/customers/#{@customer.id}"
  end

  private

  def customer_params
    params.permit(:name, :subscribed, :income)
  end
end