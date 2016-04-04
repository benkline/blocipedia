require "rails_helper"

RSpec.describe ChargesController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/charges/new").to route_to("charges#new")
    end

    it "routes to #create" do
      expect(:post => "/charges").to route_to("charges#create")
    end

  end
end
