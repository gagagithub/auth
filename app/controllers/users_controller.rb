class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.create(params[:user])
#    @user = User.create(params[:user])
  	if @user.save
  		redirect_to root_url, :notice => "Signed up!"
  	else
  		render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:email,:password)
  end

end
