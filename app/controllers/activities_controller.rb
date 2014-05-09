class ActivitiesController < ApplicationController
  before_filter :authenticate_user
  before_filter :auth_admin, :only => [:index]
  def index
  	@activities = PublicActivity::Activity.order("created_at desc")
  	u = User.all
  	@users = []
  	u.each { |x|
  		if x.login_status != 1
  			@users.push(x)
		end
	}
  end
end
