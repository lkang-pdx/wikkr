require 'rails_helper'
require 'stripe_mock'

RSpec.describe ChargesController, type: :controller do
  describe "Stripe" do
    let(:stripe_helper) { StripeMock.create_test_helper }
    before { StripeMock.start }
    after { StripeMock.stop }

    it "creates a stripe customer" do
      customer = Stripe::Customer.create({
        email: 'test@bloc.com',
        card: stripe_helper.generate_card_token
      })
      expect(customer.email).to eq('test@bloc.com')
    end

    it "mocks a declined card error" do
      StripeMock.prepare_card_error(:card_declined)

      expect { Stripe::Charge.create(amount: 1, currency: 'usd') }.to raise_error {|e|
        expect(e).to be_a Stripe::CardError
        expect(e.http_status).to eq(402)
        expect(e.code).to eq('card_declined')
      }
    end
  end
end
