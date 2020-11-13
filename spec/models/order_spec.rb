require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { should belong_to(:merchant) }
    it { should belong_to(:shopper) }
  end

  describe 'scope by orders completed' do
    let(:shopper) { FactoryBot.create(:shopper) }
    let(:merchant) { FactoryBot.create(:merchant) }
    let(:shopper_2) { FactoryBot.create(:shopper) }
    let(:merchant_2) { FactoryBot.create(:merchant, cif: 'B22233344') }
    let(:order_completed) { 
      FactoryBot.create(:order, 
        completed_at: '03/01/2018 11:46:41', 
        shopper_id: shopper.id,
        merchant_id: merchant.id)
      }
    let(:order_not_completed) { 
      FactoryBot.create(:order, 
        completed_at: '',
        shopper_id: shopper_2.id,
        merchant_id: merchant_2.id)
      }

    context 'looking for completed orders' do
      subject(:scope) { described_class.completed }

      it 'returns only completed orders' do
        expect(scope).to include(order_completed)
        expect(scope).not_to include(order_not_completed)
      end
    end
  end

  describe 'disburse_orders' do
    context 'calculate disburse per order' do
      DISBURSE_LOW_TICKETS = 0.01
      DISBURSE_MID_TICKETS = 0.0095
      DISBURSE_HIGH_TICKETS = 0.0085    

      let(:shopper) { FactoryBot.create(:shopper) }
      let(:merchant) { FactoryBot.create(:merchant) }
      let!(:order) { 
        FactoryBot.create(:order, 
          amount: '10', 
          completed_at: "2020-11-12 06:43:17",
          shopper_id: shopper.id,
          merchant_id: merchant.id) 
        }
      let!(:order_not_completed) { 
        FactoryBot.create(:order, 
          amount: '10', 
          completed_at: "",
          shopper_id: shopper.id,
          merchant_id: merchant.id) 
        }
      let!(:order_2) { 
        FactoryBot.create(:order, 
          amount: '60', 
          completed_at: "2020-11-13 06:43:17",
          shopper_id: shopper.id,
          merchant_id: merchant.id) 
        }
      let!(:order_3) { 
        FactoryBot.create(:order, 
          amount: '400', 
          completed_at: "2020-11-14 06:43:17", 
          shopper_id: shopper.id,
          merchant_id: merchant.id) 
        }

      it 'update disbursement_amount' do
        described_class.disburse_orders
        expect(order.reload.disbursement_amount).to eq order.amount - (order.amount * DISBURSE_LOW_TICKETS)
        expect(order_2.reload.disbursement_amount).to eq order_2.amount - (order_2.amount * DISBURSE_MID_TICKETS)
        expect(order_3.reload.disbursement_amount).to eq order_3.amount - (order_3.amount * DISBURSE_HIGH_TICKETS)
      end

      it 'update sequra_comission' do
        described_class.disburse_orders
        expect(order.reload.sequra_comission).to eq (order.amount * DISBURSE_LOW_TICKETS).round(2)
        expect(order_2.reload.sequra_comission).to eq (order_2.amount * DISBURSE_MID_TICKETS).round(2)
        expect(order_3.reload.sequra_comission).to eq (order_3.amount * DISBURSE_HIGH_TICKETS).round(2)
      end
    end
  end
end
