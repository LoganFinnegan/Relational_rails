require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    it { should validate_presence_of :item_name}
    it { should validate_presence_of :model}
    # it { should validate_presence_of :shipped}
  end

  describe 'relationships' do
    it {should belong_to :customer}
  end

  describe 'instance methods' do
  end
end