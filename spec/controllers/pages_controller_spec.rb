require 'rails_helper'

RSpec.describe PagesController, type: :controller do
let(:my_user) { create (:user) }
let(:my_page) { create (:page) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns :my_page to @pages" do
      get :index
      expect(assigns(:pages)).to eq(:my_page)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show
      expect(response).to render_template :show
    end

    it "assigns my_page to @page" do
      get :show
      expect(assigns(:page)).to eq(my_page)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @page" do
      get :new
      expect(assigns(:page)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Page by 1" do
      expect{ page :create, page: {title: RandomData.random_sentence, body: RandomData.random_paragraph} }.to change(Page,:count).by(1)
    end

    it "assigns the new page to @page" do
      page :create, page: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns(:page)).to eq Page.last
    end

    it "redirects to the new page" do
      page :create, page: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(response).to redirect_to [Post.last]
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, id: my_page.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, id: my_page.id
      expect(response).to render_template :edit
    end

    it "assigns page to be updated to @page" do
      get :edit, id: my_page.id
      page_instance = assigns(:page)

      expect(page_instance.id).to eq my_page.id
      expect(page_instance.title).to eq my_page.title
      expect(page_instance.body).to eq my_page.body
    end
  end

  describe "PUT update" do
    it "updates page with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, id: my_page.id, page: {title: new_title, body: new_body}

      updated_page = assigns(:page)
      expect(updated_page.id).to eq my_page.id
      expect(updated_page.title).to eq new_title
      expect(updated_page.body).to eq new_body
    end

    it "redirects to the updated page" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, id: my_page.id, page: {title: new_title, body: new_body}
      expect(response).to redirect_to [my_page]
    end
  end

  describe "DELETE destroy" do
    it "deletes the page" do
      delete :destroy, id: my_page.id
      count = Page.where({id: my_page.id}).size
      expect(count).to eq 0
    end

    it "redirects to pages index" do
      delete :destroy, id: my_page.id
      expect(response).to redirect_to pages#index
    end
  end

end
