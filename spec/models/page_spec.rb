require 'rails_helper'

RSpec.describe Page, type: :model do
let(:my_page){ create(:page, private: false) }
let(:private_page){ create(:page, private: true) }


  describe "attributes" do
    it "responds to title" do
      expect(my_page).to respond_to(:title)
    end

    it "responds to body" do
      expect(my_page).to respond_to(:body)
    end

    it "responds to private" do
      expect(my_page).to respond_to(:private)
    end
  end


  describe "methods" do
    it "make_public turns private_page into public_page " do
      # expect(private_page.private?).to be(true)
      # private_page.make_public
      # expect(private_page.private?).to be(false)
    end

    it "make_private turns public_page into private_page " do
      # expect(my_page.private?).to be(false)
      # my_page.make_private
      # expect(my_page.private?).to be(true)
    end
  end
end
