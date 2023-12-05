require 'rails_helper'

RSpec.describe 'the orders index', type: :feature do
  describe 'as a visitor' do
    before(:each) do
      @customer_1 = Customer.create!(name: "Larry", subscribed: true, income: 100)

      @order_1 = @customer_1.orders.create!(item_name: "steamdeck", shipped: true, model: 1)
      @order_2 = Order.create!(item_name: "switch", shipped: false, model: 5, customer_id: @customer_1.id)
    end

    # User Story 3, Child Index 
    it 'can see every order and its attributes' do
      # When I visit '/child_table_name'
      visit "/orders"
      # Then I see each Child in the system including the Child's attributes
      expect(page).to have_content(@order_1.item_name)
      expect(page).to have_content(@order_1.shipped)
      expect(page).to have_content(@order_1.model)
      
      expect(page).to have_content(@order_2.item_name)
      expect(page).to have_content(@order_2.shipped)
      expect(page).to have_content(@order_2.model)
    end

      # User Story 8, Child Index Link
    it 'can see the link to orders index' do
      # When I visit any page on the site
      visit "/orders"
      # Then I see a link at the top of the page that takes me to the Child Index
      expect(page).to have_link("All Orders")

      click_on("All Orders")
      
      expect(current_path).to eq("/orders")
    end
  end
end