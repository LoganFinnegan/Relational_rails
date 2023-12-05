class Order < ApplicationRecord
  validates :item_name, presence: true
  validates :model, presence: true
  # validates :shipped, presence: true, allow_blank: true

  belongs_to :customer
end