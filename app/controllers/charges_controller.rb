class ChargesController < ApplicationController

  def create
    # Creates a Stripe Customer object, for associating with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    # Creates a Stripe Charge object
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: Amount.premium,
      description: "Premium Membership - #{current_user.email}",
      currency: 'usd'
    )

    flash[:notice] = "Thank you #{current_user.email}! Private Pages are now yours to create!"
    current_user.premium!
    redirect_to pages_path(current_user)

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user.email}",
      amount: Amount.premium
    }
  end

  class Amount
    def self.premium
      9_99
    end
  end

end
