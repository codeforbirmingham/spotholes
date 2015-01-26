class AddColumnNameToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :name, :string, null: false, default: ""
  end
end
