require 'rails_helper'

RSpec.describe User, type: :model do
let(:user) { create(:user) }

  context "sign in" do
    #describe "sends email" do
    #  it "should send an confirmation email" do
    #    expect(user)
    #  end
    #end

    describe "invalid user" do
      let(:user_with_invalid_email) { build(:user, email: "") }
      let(:user_with_invalid_email_format) { build(:user, email: "invalid@email") }
      let(:user_1) { build(:user, email: "user@bloccipedia.com") }
      let(:user_2) { build(:user, email: "user@bloccipedia.com") }

      it "should be an invalid user due to blank email" do
        expect(user_with_invalid_email).to_not be_valid
      end

      it "should be an invalid user due to incorrectly formatted email address" do
        expect(user_with_invalid_email_format).to_not be_valid
      end

      #it "should be an invalid user due to duplicate email" do
      #  user_1
      #  expect(user_2).to_not be_valid
      #end
    end
    describe "session create and destroy" do

      it "should create a new session upon sign in" do
      end

      it "should destroy current session upon sign out" do
      end

      it "should ... " do
      end
    end
  end

end
