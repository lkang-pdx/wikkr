require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it { is_expected.to have_many(:wikis) }

  describe "attributes" do
    it "responds to admin?" do
      expect(user).to respond_to(:admin?)
    end

    it "responds to premium?" do
      expect(user).to respond_to(:premium?)
    end

    it "responds to standard?" do
      expect(user).to respond_to(:standard?)
    end
  end

  describe "roles" do
    context "standard user" do
      before do
        @standard_user = FactoryGirl.create(:standard)
      end

      it "returns true for #standard?" do
        expect(@standard_user.has_role? :standard).to be_truthy
      end

      it "returns false for #admin?" do
        expect(@standard_user.has_role? :admin).to be_falsey
      end

      it "returns false for #premium?" do
        expect(@standard_user.has_role? :premium).to be_falsey
      end
    end

    context "admin user" do
      before do
        @admin_user = FactoryGirl.create(:admin)
      end

      it "returns false for #standard?" do
        expect(@admin_user.has_role? :standard).to be_truthy
      end

      it "returns false for #premium?" do
        expect(@admin_user.has_role? :premium).to be_falsey
      end

      it "returns true for #admin?" do
        expect(@admin_user.has_role? :admin).to be_truthy
      end
    end

    context "premium user" do
      before do
        @premium_user = FactoryGirl.create(:premium)
      end

      it "returns false for #standard?" do
        expect(@premium_user.has_role? :standard).to be_truthy
      end

      it "returns false for #premium?" do
        expect(@premium_user.has_role? :premium).to be_truthy
      end

      it "returns true for #admin?" do
        expect(@premium_user.has_role? :admin).to be_falsey
      end
    end
  end
end
