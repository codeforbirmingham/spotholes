class ChangeUniqueIdToString < ActiveRecord::Migration
  def change
  	change_column :users, :unique_id, :string
  end
end
