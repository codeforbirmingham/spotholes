class ChangeUserUniqueIdName < ActiveRecord::Migration
  def change
  	rename_column :users, :unique_id, :imei
  end
end
