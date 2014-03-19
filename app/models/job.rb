class Job < ActiveRecord::Base
	serialize :applicants, Array
end
