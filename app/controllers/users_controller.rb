class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    u = User.find(params[:id])
    u.update_attributes(user_params)
    respond_to do |format|
      format.html { render html: u.avatar.url }
    end
  end

  private
  def user_params
    params.require(:user).permit(:avatar)
  end
end
