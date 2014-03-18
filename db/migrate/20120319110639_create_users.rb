class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username 
    	t.string :email
    	t.string :encrypted_password 
    	t.string :salt
		t.integer :is_admin
		t.text :app_for
      	t.timestamps
    end
  end
end
