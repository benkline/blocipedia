require 'rails_helper'
require 'random_data'

RSpec.describe PagesController, type: :controller do
let(:user)                { create :user }
let(:free_user)           { create :user, role: 0 }
let(:creator)             { create :creator }
let(:collaborator)        { create :collaborator }
let(:admin)               { create :user, role: 2 }
let(:page)                { create :page, private: false}
let(:collaborating_page)  { create :collaborating_page}
let(:created_page)        { create :page, private: true, creator: user}

  before do
    sign_in user
    sign_in free_user
    sign_in creator
    sign_in collaborator
    sign_in admin
  end

  context "basic pages crud" do

    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, id: page.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, id: page.id
        expect(response).to render_template :show
      end

      it "assigns page to @page" do
        get :show, id: page.id
        expect(assigns(:page)).to eq(page)
      end
    end

    describe "GET new" do
      it "returns http success" do
        get :new, id: page.id, user: user
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new, id: page.id
        expect(response).to render_template :new
      end

      it "instantiates @page" do
        get :new, id: page.id
        expect(assigns(:page)).not_to be_nil
      end
    end

    describe "page create" do
      it "increases the number of page by 1" do
        expect do
          post :create, page: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        end.to change(Page, :count).by(1)
      end

      it "assigns the new page to @page" do
        post :create, page: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        expect(assigns(:page)).to eq Page.last
      end

      it "redirects to the new page" do
        post :create, page: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        expect(response).to redirect_to [Page.last]
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, id: page.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, id: page.id
        expect(response).to render_template :edit
      end

      it "assigns page to be updated to @page" do
        get :edit, id: page.id
        page_instance = assigns(:page)

        expect(page_instance.id).to eq page.id
        expect(page_instance.title).to eq page.title
        expect(page_instance.body).to eq page.body
      end
    end

    describe "PUT update" do
      it "updates page with expected attributes" do
        new_title = RandomData.random_sentence
        new_body = RandomData.random_paragraph

        put :update, id: page.id, page: {title: new_title, body: new_body}

        updated_page = assigns(:page)
        expect(updated_page.id).to eq page.id
        expect(updated_page.title).to eq new_title
        expect(updated_page.body).to eq new_body
      end

      it "redirects to the updated page" do
        new_title = RandomData.random_sentence
        new_body = RandomData.random_paragraph

        put :update, id: page.id, page: {title: new_title, body: new_body}
        expect(response).to redirect_to [page]
      end
    end

    describe "DELETE destroy" do
      it "deletes the page" do
        count = Page.where({id: page.id}).size
        expect(count).to eq 1

        delete :destroy, id: page.id
        count = Page.where({id: page.id}).size
        expect(count).to eq 0
      end

      it "redirects to pages index" do
        delete :destroy, id: page.id
        expect(response).to redirect_to pages_path
      end
    end
  end

  context "authorization" do
    describe "free user" do
      it "should NOT be able to view any private pages" do
      end

      it "should be able to view all public pages" do
      end
    end

    describe "premium user" do
      it "should be able to view created pages" do
      end

      it "should be able to view collaborating pages" do
      end

      it "should NOT be able to view other user's private pages" do
      end

      it "should be able to view all public pages" do
      end

    end

    describe "admin user" do
      it "should be able to view all private pages" do
      end

      it "should be able to view private pages" do
      end

      it "should be able to view all public pages" do
      end
    end

  end
end
