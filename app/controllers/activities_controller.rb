class ActivitiesController < ApplicationController
  before_filter :authenticate_user
  before_filter :auth_admin, :only => [:index]
  def index
  	@activities = PublicActivity::Activity.order("created_at desc")
  end
end
