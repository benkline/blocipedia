require 'rails_helper'

RSpec.describe User, type: :model do
let(:user) { create(:user) }
let(:public_user) { create(:user, role: 0) }
let(:admin) { create(:user, role: 2) }
let(:creator) { create(:creator) }
let(:collaborator) { create(:collaborator) }

  context "attributes" do
    it "responds to email" do
      expect(user).to respond_to(:email)
    end

    it "responds to created_at" do
      expect(user).to respond_to(:created_at)
    end
  end

  context "model methods" do
    describe ".upgrade" do
      it ".upgrade changes public role to premium" do
        expect(public_user.premium?).to be_falsey
        public_user.upgrade
        expect(public_user.premium?).to be_truthy
      end
    end

    describe ".downgrade" do
      it ".downgrade changes premium role to public" do
        expect(user.standard?).to be_falsey
        user.downgrade
        expect(user.standard?).to be_truthy
      end

      it ".downgrade changes admin role to public" do
        expect(admin.standard?).to be_falsey
        admin.downgrade
        expect(admin.standard?).to be_truthy
      end

    end

    describe ".make_admin" do
      it ".make_admin ugrades premium to admin" do
        expect(user.admin?).to be_falsey
        user.make_admin
        expect(user.admin?).to be_truthy
      end

      it "makes public_user admin" do
        expect(public_user.admin?).to be_falsey
        public_user.make_admin
        expect(public_user.admin?).to be_truthy
      end
    end

    describe "roles" do
      it "premium? returns false for other users" do
        expect(public_user.premium?).to be_falsey
        expect(admin.premium?).to be_falsey
      end

      it "premium? returns true for premium_user" do
        expect(user.premium?).to be_truthy
      end

      it "admin? returns false for non-admin users" do
        expect(user.admin?).to be_falsey
        expect(public_user.admin?).to be_falsey
      end

      it "admin? returns true for admin" do
        expect(admin.admin?).to be_truthy
      end

    end
  end

end
