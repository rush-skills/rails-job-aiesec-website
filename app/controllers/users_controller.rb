  class UsersController < ApplicationController

  before_filter :save_login_state, :only => [:new, :create]
  before_filter :auth_admin, :only => [:enable, :change_match_state, :index, :make_admin, :remove_admin]
  def show
    @user = User.find(params[:id])
  end
  def new
      #Signup Form
      @user = User.new     
  end
  def index
    @users = User.all
  end

 def create
  	@user = User.new(params[:user])
	  @user.app_for = []
    @user.login_status = 0
  	if @user.save
      Notifier.send_signup_email(@user).deliver
      Notifier.send_admin_email(@user).deliver
  		flash[:notice] = "You Signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "new"
  end
  def enable
    @user = User.find(params[:id])
    @user.login_status = 1
    @user.match_status = ""
    @user.save
    Notifier.send_confirmation_email(@user).deliver
    redirect_to :controller => 'activities', :action => 'index'
  end
  def change_match_state
    @user = User.find(params[:id])
    @user.match_status = params[:state]
    @user.save
    redirect_to :controller => 'sessions', :action => 'profile', :id => @user.id
  end
  def make_admin
    @user = User.find(params[:id])
    @user.is_admin = 1
    @user.save
    redirect_to :controller => 'jobs', :action => 'index'
  end
  def remove_admin
    @user = User.find(params[:id])
    @user.is_admin = 0
    @user.save
    redirect_to :controller => 'jobs', :action => 'index'
  end
end
