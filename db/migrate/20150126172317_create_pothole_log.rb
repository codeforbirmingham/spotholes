class CreatePotholeLog < ActiveRecord::Migration
  def change
    create_table :pothole_logs do |t|
      t.integer :pothole_id
      t.integer :admin_user_id
      t.integer :user_id
      t.string :status
      t.timestamps
    end

    add_index :pothole_logs, :pothole_id
  end
end
