require 'rails_helper'

RSpec.describe 'The customers index', type: :feature do
  describe 'as a visitor' do
    before(:each) do
      @customer_1 = Customer.create!(name: "Larry", subscribed: true, income: 100) 
      @customer_2 = Customer.create!(name: "John", subscribed: false, income: 200) 
    end
    
    # User Story 1, Parent Index 
    it 'can see the name of each customer' do
      # When I visit '/parents'
      visit "/customers" 
      # Then I see the name of each parent record in the system
      expect(page).to have_content(@customer_1.name)
      expect(page).to have_content(@customer_2.name)
    end

    # User Story 6, Parent Index sorted by Most Recently Created 
    it "can order records by most recently created" do
      # When I visit the parent index
      visit "/customers"
      # I see that records are ordered by most recently created first
      expect(@customer_1.name).to appear_before(@customer_2.name)
      expect(@customer_2.name).to_not appear_before(@customer_1.name)
      #And next to each of the records I see when it was created
      within "#customer-#{@customer_1.id}" do
        expect(page).to have_content(@customer_1.created_at)
      end

      within "#customer-#{@customer_2.id}" do
        expect(page).to have_content(@customer_2.created_at)
      end
    end

    # User Story 9, Parent Index Link
    it "can see the link to customers index" do 
      # When I visit any page on the site
      visit "/customers"
      # Then I see a link at the top of the page that takes me to the Parent Index
      expect(page).to have_link("All Customers")

      click_on("All Customers")

      expect(current_path).to eq("/customers")
    end
  end
end