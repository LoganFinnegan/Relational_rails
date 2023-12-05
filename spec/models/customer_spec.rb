require 'rails_helper'

RSpec.describe Customer, type: :model do
  before(:each) do
    @customer_1 = Customer.create!(name: "Larry", subscribed: true, income: 100) 
    @customer_2 = Customer.create!(name: "John", subscribed: false, income: 200) 

    @order_1 = @customer_1.orders.create!(item_name: "steamdeck", shipped: true, model: 1)
    @order_2 = Order.create!(item_name: "switch", shipped: false, model: 5, customer_id: @customer_1.id)
  end
  
  describe 'validations' do
    it { should validate_presence_of :name}
    # it { should validate_presence_of :subscribed}
    it { should validate_presence_of :income}
  end
  
  describe 'relationships' do
    it {should have_many :orders}
  end
  
  describe 'instance methods' do 
    it "can count orders" do
      expect(@customer_1.order_count).to eq(2)
    end
  end

  describe 'class methods' do
    it 'can sort by created by date' do
      expect(Customer.sort_by_created_date).to eq([@customer_1, @customer_2])
    end
  end
end