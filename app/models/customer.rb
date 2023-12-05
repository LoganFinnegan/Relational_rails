class Customer < ApplicationRecord
  validates :name, presence: true 
  # validates :subscribed, presence: true, allow_blank: true, allow_nil: true
  validates :income, presence: true

  has_many :orders, dependent: :destroy
  
  def self.sort_by_created_date
    order(:created_at)
  end

  def order_count
    orders.count
  end
end

#represents customer table
#checks for validations "aka attributes"
#defines relationships
#defines any instance or class methods that manipulate data on/in this table

#if does any of the above add it to the model customer spec testing
