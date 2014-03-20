  class UsersController < ApplicationController

  before_filter :save_login_state, :only => [:new, :create]
  def show
    @user = User.find(params[:id])
    render "profile"
  end
  def new
      #Signup Form
      @user = User.new     
  end

   def create
    	@user = User.new(params[:user])
		@user.app_for = []
    	if @user.save
        Notifier.send_signup_email(@user).deliver
    		flash[:notice] = "You Signed up successfully"
        flash[:color]= "valid"
      else
        flash[:notice] = "Form is invalid"
        flash[:color]= "invalid"
      end
      render "new"
    end

end
