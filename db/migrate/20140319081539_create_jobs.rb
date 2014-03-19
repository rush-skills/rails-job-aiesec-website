class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :project_name
      t.string :country
      t.string :start_date
      t.string :end_date
      t.text :brief_description
      t.text :job_description
      t.text :work_information
      t.text :skills
      t.string :language
      t.text :other_details
      t.text :applicants

      t.timestamps
    end
  end
end
