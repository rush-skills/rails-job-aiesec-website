class AddApplyDateToJobs < ActiveRecord::Migration
  def change
  	add_column :jobs, :apply_date, :text
  end
end
