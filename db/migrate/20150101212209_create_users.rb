class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :unique_id
      t.integer :score

      t.timestamps
    end
  end
end
