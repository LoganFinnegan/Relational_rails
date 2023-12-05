require 'rails_helper'

RSpec.describe 'The customer update', type: :feature do
  describe 'as a visitor' do
    before(:each) do
      @customer_1 = Customer.create!(name: "Larry", subscribed: true, income: 100) 

      @order_1 = @customer_1.orders.create!(item_name: "steamdeck", shipped: true, model: 1)
      @order_2 = Order.create!(item_name: "switch", shipped: false, model: 5, customer_id: @customer_1.id)
    end

    # User Story 12, Parent Update 
    it "can update the customer" do
      # When I visit a parent show page
      visit "/customers/#{@customer_1.id}"
      # Then I see a link to update the parent "Update Parent"
      expect(page).to have_link("Update #{@customer_1.name}")
      # When I click the link "Update Parent"
      click_on("Update #{@customer_1.name}")
      # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
      expect(current_path).to eq("/customers/#{@customer_1.id}/edit")
      # When I fill out the form with updated information
      fill_in("name", with: "Larry")
      fill_in("subscribed", with: true)
      fill_in("income", with: 150)
      # And I click the button to submit the form
      click_on("submit")
      # Then a `PATCH` request is sent to '/parents/:id',
      expect(current_path).to eq("/customers/#{@customer_1.id}")
      # the parent's info is updated,
      expect(page).to have_content(150)
      # and I am redirected to the Parent's Show page where I see the parent's updated info
    end
  end
end