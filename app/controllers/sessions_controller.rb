class SessionsController < ApplicationController
 
	before_filter :authenticate_user, :except => [:index, :login, :login_attempt, :logout]
	before_filter :save_login_state, :only => [:index, :login, :login_attempt]

	def admin
		#Admin Page
		@activities = PublicActivity::Activity.all
	end
	def home
		#Home Page
	end

	def profile
		#Profile Page
	end

	def setting
		#Setting Page
	end

	def login
		#Login Form
	end

	def login_attempt
		authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
		if authorized_user
			session[:user_id] = authorized_user.id
			flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
			if authorized_user.is_admin == 1
				redirect_to(:action => 'admin')
			else
				redirect_to(:action => 'home')
			end


		else
			flash[:notice] = "Invalid Username or Password"
        	flash[:color]= "invalid"
			render "login"	
		end
	end
	def apply
		u = User.find(session[:user_id])
		job = Job.find_by_id(params[:id])
		appfor = job.id
		unless u.app_for.include?(appfor)
			u.app_for.push(appfor)
			u.save!
			flash[:notice] = "You have successfully applied up for this job"
        	flash[:color]= "valid"
			redirect_to(:back)	
		else
			flash[:notice] = "You have already applied up for this job"
        	flash[:color]= "invalid"
			redirect_to(:back)	
		end
		unless job.applicants.include?(u.id)
			job.applicants.push(u.id)
			job.save!
		end
	end
	def logout
		session[:user_id] = nil
		redirect_to :action => 'login'
	end

end
