class CreatePotholes < ActiveRecord::Migration
  def change
    create_table :potholes do |t|
      t.string :name
      t.decimal :longitude
      t.decimal :latitude
      t.string :status
      t.integer :score
      t.belongs_to :user

      t.timestamps
    end
  end
end
