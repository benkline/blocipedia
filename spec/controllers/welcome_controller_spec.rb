require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  let(:user) {create(:user)}
  let(:user_with_invalid_email) { build(:user, email: "") }
  let(:user_with_invalid_email_format) { build(:user, email: "invalid@email") }

  describe "views" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    # it "returns http success" do
    #   get :about
    #   expect(response).to have_http_status(:success)
    # end
  end

  describe "authentication" do
    it "users can sign in" do
      sign_in user
      expect(subject.current_user).to_not eq(nil)
    end

    it "users can sign out" do
      sign_out user
      expect(subject.current_user).to eq(nil)
    end

    it "correctly formatted email is valid" do
      expect(user).to be_valid
    end

    it "blank email is invalid" do
      expect(user_with_invalid_email).to_not be_valid
    end

    it "incorrectly formatted email is invalid" do
      expect(user_with_invalid_email_format).to_not be_valid
    end
  end
end
