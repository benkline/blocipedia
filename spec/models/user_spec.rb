require 'rails_helper'

RSpec.describe User, type: :model do
let(:user) { create(:user) }

  context "parameters" do
    it "responds to email" do
      expect(user).to respond_to(:email)
    end

    it "responds to created_at" do
      expect(user).to respond_to(:created_at)
    end

    it "responds to updated_at" do
      expect(user).to respond_to(:updated_at)
    end
  end

  context "premium and admin users" do
    let(:premium_user) { create(:user, role: 1) }
    let(:admin_user) { create(:user, role: 2) }

    it "premium? returns false for standard user" do
      expect(user.premium?).to be_falsey
    end

    it "admin? returns false for standard user" do
      expect(user.admin?).to be_falsey
    end

    it "premium? returns true for premium_user" do
      expect(premium_user.premium?).to be_truthy
    end

    it "admin? returns false for premium_user" do
      expect(premium_user.admin?).to be_falsey
    end

    it "premium? returns false for admin" do
      expect(admin_user.premium?).to be_falsey
    end

    it "admin? returns true for admin" do
      expect(admin_user.admin?).to be_truthy
    end
  end

  context "Stripe customer" do
    it "stores Stripe customer id in a hash with the user email" do
    end
  end

end
