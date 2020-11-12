require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { should have_many(:merchants).dependent(:destroy) }
    it { should have_many(:shoppers).dependent(:destroy) }
  end
end
