require 'rails_helper'

RSpec.describe 'the order show', type: :feature do
  describe 'as a visitor' do
    before(:each) do
      @customer_1 = Customer.create!(name: "Larry", subscribed: true, income: 100)

      @order_1 = @customer_1.orders.create!(item_name: "steamdeck", shipped: true, model: 1)
    end
    
    # User Story 4, Child Show 
    it 'can see the order and its attributes' do
      # When I visit '/child_table_name/:id'
      visit "/orders/#{@order_1.id}"
      # Then I see the child with that id including the childs attributes
      expect(page).to have_content(@order_1.item_name)
      expect(page).to have_content(@order_1.shipped)
      expect(page).to have_content(@order_1.model)
      
    end
  end
end