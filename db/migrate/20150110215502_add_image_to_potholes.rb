class AddImageToPotholes < ActiveRecord::Migration
  def change
    add_attachment :potholes, :image
  end
end
