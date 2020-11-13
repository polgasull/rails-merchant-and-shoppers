require 'rails_helper'

RSpec.describe 'Orders API', type: :request do
  
  describe 'GET /orders' do
    let!(:shopper) { FactoryBot.create(:shopper) }
    let!(:merchant) { FactoryBot.create(:merchant) }
    let!(:orders) { 
      FactoryBot.create_list(:order, 
        10, 
        shopper_id: shopper.id, 
        merchant_id: merchant.id,
        completed_at: "2018-01-05T06:08:53.000Z") 
      }

    before { get '/orders' }

    it 'returns orders' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

end