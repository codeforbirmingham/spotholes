class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :unique_key

      t.timestamps null: false
    end
  end
end
