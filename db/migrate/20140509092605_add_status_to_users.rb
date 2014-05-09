class AddStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login_status, :integer

    add_column :users, :match_status, :string

  end
end
