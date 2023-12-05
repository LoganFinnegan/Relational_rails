require 'rails_helper'

RSpec.describe 'The customer show', type: :feature do
  describe 'as a visitor' do
    before(:each) do
      @customer_1 = Customer.create!(name: "Larry", subscribed: true, income: 100) 

      @order_1 = @customer_1.orders.create!(item_name: "steamdeck", shipped: true, model: 1)
      @order_2 = Order.create!(item_name: "switch", shipped: false, model: 5, customer_id: @customer_1.id)
    end
    
    # User Story 1, Parent show 
    it 'can see the attributes of a customer' do
      # When I visit '/parents/:id'
      visit "/customers/#{@customer_1.id}" 
      # Then I see the parent with that id including the parents attributes
      expect(page).to have_content(@customer_1.name)
      expect(page).to have_content(@customer_1.subscribed)
      expect(page).to have_content(@customer_1.income)
    end

    # User Story 7, Parent Child Count
    it 'can see a count of the orders associated with the customer' do
      # When I visit a parent's show page
      visit "/customers/#{@customer_1.id}"
      # I see a count of the number of children associated with this parent
      expect(page).to have_content("Order Count: 2")
    end

     # User Story 10, Parent Child Index Link
     it "has a link to a customer orders" do 
      # When I visit a parent show page ('/parents/:id')
      visit "/customers/#{@customer_1.id}"
      # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
      expect(page).to have_link("#{@customer_1.name}'s Orders")
      
      click_on("#{@customer_1.name}'s Orders")

      expect(current_path).to eq("/customers/#{@customer_1.id}/orders")
    end
  end
end