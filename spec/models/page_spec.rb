require 'rails_helper'

RSpec.describe Page, type: :model do
let(:page){ create(:page) }
let(:collaborating_page){ create(:collaborating_page) }


  context "attributes" do
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


  context "methods" do
    describe ".make_public" do
      it "make_public turns private page public " do
        expect(collaborating_page.private?).to be_truthy
        collaborating_page.make_public
        expect(collaborating_page.public?).to be_truthy
      end

    end

    describe ".make_private" do
      it "make_private turns public_page into private_page " do
        expect(page.public?).to be_truthy
        page.make_private
        expect(page.private?).to be_truthy
      end
    end

    describe ".update_collaborators"do
      it "" do
      end
    end
  end
end
