class CreatePotholes < ActiveRecord::Migration
  def change
    create_table :potholes do |t|
      t.string :name
      t.double :latitude
      t.double :longitude
      t.int :score
      t.string :submitter
      t.string :status

      t.timestamps null: false
    end
  end
end
