class PaymentsController < ApplicationController
  def show
  end

  def destroy
    @user = current_user
    @user.customer_id = nil
    @user.save
    redirect_to profile_path
  end
end
