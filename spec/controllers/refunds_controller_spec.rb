require 'rails_helper'

RSpec.describe RefundsController, type: :controller do

  describe "GET #new" do
     it "assigns a new refund as @refund" do
    #   get :new, {}, valid_session
    #   expect(assigns(:refund)).to be_a_new(refund)
     end
  end

  describe "POST #create" do
     context "with valid params" do
       it "creates a new refund" do
    #     expect {
    #       post :create, {:refund => valid_attributes}, valid_session
    #     }.to change(refund, :count).by(1)
       end
    #
       it "assigns a newly created refund as @refund" do
    #     post :create, {:refund => valid_attributes}, valid_session
    #     expect(assigns(:refund)).to be_a(refund)
    #     expect(assigns(:refund)).to be_persisted
       end
    #
       it "redirects to the created refund" do
    #     post :create, {:refund => valid_attributes}, valid_session
    #     expect(response).to redirect_to(refund.last)
       end
    end

    context "with invalid params" do
       it "assigns a newly created but unsaved refund as @refund" do
      #   post :create, {:refund => invalid_attributes}, valid_session
      #   expect(assigns(:refund)).to be_a_new(refund)
       end
      #
       it "re-renders the 'new' template" do
      #   post :create, {:refund => invalid_attributes}, valid_session
      #   expect(response).to render_template("new")
       end
    end
  end

  # describe "PUT #update" do
  #    context "with valid params" do
  #   #   let(:new_attributes) {
  #   #     skip("Add a hash of attributes valid for your model")
  #   #   }
  #   #
  #      it "updates the requested refund" do
  #   #     refund = refund.create! valid_attributes
  #   #     put :update, {:id => refund.to_param, :refund => new_attributes}, valid_session
  #   #     refund.reload
  #   #     skip("Add assertions for updated state")
  #      end
  #   #
  #      it "assigns the requested refund as @refund" do
  #   #     refund = refund.create! valid_attributes
  #   #     put :update, {:id => refund.to_param, :refund => valid_attributes}, valid_session
  #   #     expect(assigns(:refund)).to eq(refund)
  #      end
  #   #
  #      it "redirects to the refund" do
  #   #     refund = refund.create! valid_attributes
  #   #     put :update, {:id => refund.to_param, :refund => valid_attributes}, valid_session
  #   #     expect(response).to redirect_to(refund)
  #      end
  #   end
  #
  #   context "with invalid params" do
  #      it "assigns the refund as @refund" do
  #   #     refund = refund.create! valid_attributes
  #   #     put :update, {:id => refund.to_param, :refund => invalid_attributes}, valid_session
  #   #     expect(assigns(:refund)).to eq(refund)
  #      end
  #   #
  #      it "re-renders the 'edit' template" do
  #   #     refund = refund.create! valid_attributes
  #   #     put :update, {:id => refund.to_param, :refund => invalid_attributes}, valid_session
  #   #     expect(response).to render_template("edit")
  #      end
  #    end
  # end
  #
  # describe "DELETE #destroy" do
  #    it "destroys the requested refund" do
  #   #   refund = refund.create! valid_attributes
  #   #   expect {
  #   #     delete :destroy, {:id => refund.to_param}, valid_session
  #   #   }.to change(refund, :count).by(-1)
  #    end
  #   #
  #    it "redirects to the refunds list" do
  #   #   refund = refund.create! valid_attributes
  #   #   delete :destroy, {:id => refund.to_param}, valid_session
  #   #   expect(response).to redirect_to(refunds_url)
  #    end
  # end

end
