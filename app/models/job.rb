class Job < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user}
	serialize :applicants, Array
	serialize :apply_date, Array
	attr_accessible :project_name, :country, :start_date, :end_date, :brief_description, :job_description, :work_information, :skills, :language, :other_details, :applicants, :apply_date, :status
end
