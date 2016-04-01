require 'rails_helper'

RSpec.describe Page, type: :model do
let(:page){ create(:page) }

   describe "attributes" do
     it "responds to title" do
       expect(page).to respond_to(:title)
     end

     it "responds to body" do
       expect(page).to respond_to(:body)
     end

     it "responds to private" do
       expect(page).to respond_to(:private)
     end
  end
end
