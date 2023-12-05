require 'rails_helper'

RSpec.describe 'a new customer', type: :feature do
  describe 'as a visitor' do
 # User Story 11, Parent Creation 
    it "adds a new customer" do 
      # When I visit the Parent Index page
      visit "/customers"
      # Then I see a link to create a new Parent record, "New Parent"
      expect(page).to have_link("New Customer")
      # When I click this link
      click_on("New Customer")
      # Then I am taken to '/parents/new' where I  see a form for a new parent record
      expect(current_path).to eq("/customers/new")
      # When I fill out the form with a new parent's attributes:
      fill_in :name, with: "Jack"
      fill_in :subscribed, with: true
      fill_in :income, with: 150
      # And I click the button "Create Parent" to submit the form
      click_on("Create Customer")
      # Then a `POST` request is sent to the '/parents' route,
      # and I am redirected to the Parent Index page where I see the new Parent displayed.
      expect(current_path).to eq("/customers")
      # `.last` is calling the most recent thing created because thigns are added to the end of a array when added
      new_customer = Customer.last 
      
      # a new parent record is created,
      expect(page).to have_content(new_customer.name)
      expect(page).to have_content(new_customer.subscribed)
      expect(page).to have_content(new_customer.income)
    end
  end
end