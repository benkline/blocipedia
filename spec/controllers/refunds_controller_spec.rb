require 'rails_helper'

RSpec.describe RefundsController, type: :controller do
let(:user) { create(:user, role: 0) }
  before do
    sign_in user
  end

  describe "GET #new" do
    context "Stripe" do
    end

    it "sets user to standard role" do
      # get :new
      # expect(user.standard?).to be_truthy
    end

    it "redirects to pages#index" do
      # get :new
      # expect(response).to redirect_to(index)
    end
  end

  describe "POST #create" do
    context "Stripe" do
      it "retrievs customer.id from user model hash" do
      end

      it "creates Stripe refund object" do
      end
    end

    it "sets user to standard role" do
      # get :new
      # expect(user.standard?).to be_truthy
    end

    it "redirects to pages#index" do
      # get :create
      # expect(response).to redirect_to("/pages.1")
    end
  end
end
