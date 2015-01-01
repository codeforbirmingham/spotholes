class ChangePotholeStatusToEnum < ActiveRecord::Migration
  def change
  	change_column :potholes, :status, 'integer USING CAST("status" AS integer)'
  end
end
