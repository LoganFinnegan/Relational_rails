require 'rails_helper'

RSpec.describe 'a new customer order', type: :feature do
  describe 'as a visitor' do
    before(:each) do
      @customer_1 = Customer.create!(name: "Larry", subscribed: true, income: 100)
    end

    # User Story 13, Parent Child Creation 
    it "can create a new customer order" do 
      # When I visit a Parent Children Index page
      visit "/customers/#{@customer_1.id}/orders"
      # Then I see a link to add a new adoptable child for that parent "Create Child"
      expect(page).to have_link("Create Order")
      # When I click the link
      click_on("Create Order")
      # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
      expect(current_path).to eq("/customers/#{@customer_1.id}/orders/new")
      # When I fill in the form with the child's attributes:
      fill_in(:item_name, with: "SteamDeck")
      fill_in(:model, with: 1)
      fill_in(:shipped, with: true)
      # And I click the button "Create Child"
      click_on("Create Order")
      # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
      expect(current_path).to eq("/customers/#{@customer_1.id}/orders") 
      # a new child object/row is created for that parent,
      # and I am redirected to the Parent Childs Index page where I can see the new child listed
      expect(page).to have_content("SteamDeck")
      expect(page).to have_content(1)
      expect(page).to have_content(true)
    end
  end
end