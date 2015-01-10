ActiveAdmin.register Pothole do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :name, :longitude, :latitude, :status, :score, :user
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  form do |f|
    f.inputs "User" do
      f.input :user
    end
    f.inputs "Name" do
      f.input :name
    end
    f.inputs "Location" do
      f.input :longitude
      f.input :latitude
    end
    f.inputs "Status" do
      f.input :status, as: :select, collection: Pothole.statuses.keys
    end
    f.inputs "Score" do
      f.input :score
    end
    f.actions
  end
end
