require 'rails_helper'

RSpec.describe ChargesController, type: :controller do

  describe "GET #new" do
     it "assigns a new charge as @charge" do
    #   get :new, {}, valid_session
    #   expect(assigns(:charge)).to be_a_new(Charge)
     end
  end

  describe "POST #create" do
     context "with valid params" do
       it "creates a new Charge" do
    #     expect {
    #       post :create, {:charge => valid_attributes}, valid_session
    #     }.to change(Charge, :count).by(1)
       end
    #
       it "assigns a newly created charge as @charge" do
    #     post :create, {:charge => valid_attributes}, valid_session
    #     expect(assigns(:charge)).to be_a(Charge)
    #     expect(assigns(:charge)).to be_persisted
       end
    #
       it "redirects to the created charge" do
    #     post :create, {:charge => valid_attributes}, valid_session
    #     expect(response).to redirect_to(Charge.last)
       end
    end

    context "with invalid params" do
       it "assigns a newly created but unsaved charge as @charge" do
      #   post :create, {:charge => invalid_attributes}, valid_session
      #   expect(assigns(:charge)).to be_a_new(Charge)
       end
      #
       it "re-renders the 'new' template" do
      #   post :create, {:charge => invalid_attributes}, valid_session
      #   expect(response).to render_template("new")
       end
    end
  end

  describe "PUT #update" do
     context "with valid params" do
    #   let(:new_attributes) {
    #     skip("Add a hash of attributes valid for your model")
    #   }
    #
       it "updates the requested charge" do
    #     charge = Charge.create! valid_attributes
    #     put :update, {:id => charge.to_param, :charge => new_attributes}, valid_session
    #     charge.reload
    #     skip("Add assertions for updated state")
       end
    #
       it "assigns the requested charge as @charge" do
    #     charge = Charge.create! valid_attributes
    #     put :update, {:id => charge.to_param, :charge => valid_attributes}, valid_session
    #     expect(assigns(:charge)).to eq(charge)
       end
    #
       it "redirects to the charge" do
    #     charge = Charge.create! valid_attributes
    #     put :update, {:id => charge.to_param, :charge => valid_attributes}, valid_session
    #     expect(response).to redirect_to(charge)
       end
    end

    context "with invalid params" do
       it "assigns the charge as @charge" do
    #     charge = Charge.create! valid_attributes
    #     put :update, {:id => charge.to_param, :charge => invalid_attributes}, valid_session
    #     expect(assigns(:charge)).to eq(charge)
       end
    #
       it "re-renders the 'edit' template" do
    #     charge = Charge.create! valid_attributes
    #     put :update, {:id => charge.to_param, :charge => invalid_attributes}, valid_session
    #     expect(response).to render_template("edit")
       end
     end
  end

  describe "DELETE #destroy" do
     it "destroys the requested charge" do
    #   charge = Charge.create! valid_attributes
    #   expect {
    #     delete :destroy, {:id => charge.to_param}, valid_session
    #   }.to change(Charge, :count).by(-1)
     end
    #
     it "redirects to the charges list" do
    #   charge = Charge.create! valid_attributes
    #   delete :destroy, {:id => charge.to_param}, valid_session
    #   expect(response).to redirect_to(charges_url)
     end
  end

end