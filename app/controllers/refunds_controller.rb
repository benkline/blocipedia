class RefundsController < ApplicationController
  def create
    # # Creates a Stripe refund object
    # refund = Stripe::Refund.create(
    #   charge: #how to easily recall this? Store it in a hash when created? then recall it via current_user.email as key/value pair?
    # )
    #
    # flash[:notice] = "Sorry to see you go #{current_user.email}! Public Pages will always be free to create and edit."
    #
    # rescue Stripe::CardError => e
    #   flash[:alert] = e.message
    #   redirect_to new_refund_path
  end

  def new
    current_user.standard!
    redirect_to pages_path(current_user)
    # @stripe_btn_data = {
    #   key: "#{ Rails.configuration.stripe[:publishable_key] }",
    #   description: "Refund for Premium Membership - #{current_user.email}",
    #   amount: Amount.premium
    # }
  end
end
