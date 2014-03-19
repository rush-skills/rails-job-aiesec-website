class Job < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user}
	serialize :applicants, Array
	attr_accessible :project_name, :applicants
end
