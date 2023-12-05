require 'rails_helper'

RSpec.describe 'the customer orders index', type: :feature do
  describe 'as a visitor' do
    before(:each) do
      @customer_1 = Customer.create!(name: "Larry", subscribed: true, income: 100)

      @order_1 = @customer_1.orders.create!(item_name: "steamdeck", shipped: true, model: 1)
      @order_2 = Order.create!(item_name: "switch", shipped: false, model: 5, customer_id: @customer_1.id)
    end

    # User Story 5, Parent Children Index 
    it "sees the child and the childs attributes" do
      # When I visit '/parents/:parent_id/child_table_name'
      visit "/customers/#{@customer_1.id}/orders"
      # Then I see each Child that is associated with that Parent with each Child's attributes
      expect(page).to have_content(@order_1.item_name)
      expect(page).to have_content(@order_1.shipped)
      expect(page).to have_content(@order_1.model)

      expect(page).to have_content(@order_2.item_name)
      expect(page).to have_content(@order_2.shipped)
      expect(page).to have_content(@order_2.model)
    end
  end
end