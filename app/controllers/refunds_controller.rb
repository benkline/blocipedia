class RefundsController < ApplicationController
  def create
    #
    # # Retrieves the Stripe Charge object
    # charge = Stripe::Charge.retrieve(
    #   email: current_user.email,
    #   amount: Amount.premium,
    #   description: "Refund - #{current_user.email}",
    #   currency: 'usd'
    # )
    #
    # # Creates a Stripe refund object
    # refund = Stripe::Refund.create(
    #   charge: charge_id <- how do get that?
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
    # #use this one to get the customer charge data
    # @stripe_btn_data = {
    #   key: "#{ Rails.configuration.stripe[:publishable_key] }",
    #   description: "Refund for Premium Membership - #{current_user.email}",
    #   amount: Amount.premium
    # }
  end
end
