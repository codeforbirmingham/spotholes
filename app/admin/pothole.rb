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
     f.input :user
     f.input :name
     f.input :longitude
     f.input :latitude
     f.input :status, as: :select, collection: Pothole.statuses.keys
     f.input :score
     f.actions
   end


end
