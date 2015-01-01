class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :status
      t.belongs_to :pothole

      t.timestamps
    end
  end
end
