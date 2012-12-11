class PaymentsController < ApplicationController
  before_filter :authenticate_user!

  def show
    stash_referrer
  end

  def create
    @user = current_user
    customer = Stripe::Customer.create(
      card: params[:stripeToken],
      description: "PlusDollar: #{current_user.name}",
      email: current_user.email
    )

    if customer.active_card
      @user.customer_id = customer.id
      @user.save
      redirect_back_or profile_path
    else
      flash.now[:alert] = "Unable to verify your credit card, please try again or contact support for assistance."
      render :show
    end
  end

  def destroy
    @user = current_user
    @user.customer_id = nil
    @user.save
    redirect_to profile_path
  end
end
