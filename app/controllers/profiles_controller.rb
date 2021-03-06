class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to profile_path, notice: 'Your profile has been updated'
    else
      render :show
    end
  end
end
