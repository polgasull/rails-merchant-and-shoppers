require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { should belong_to(:merchant) }
    it { should belong_to(:shopper) }
  end
end
