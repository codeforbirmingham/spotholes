ActiveAdmin.register Pothole do

  preserve_default_filters!
  filter :status, as: :select, collection: Pothole.statuses.keys

  index do |i|
    i.column :id
    i.column :name
    i.column :latitude
    i.column :longitude
    i.column :status
    i.column :score
    i.column 'Image', sortable: false do |pothole|
      image_tag pothole.image.url(:hdpi)
    end
    i.column :user, sortable: 'users.name'
    i.column :created_at
    i.column :updated_at
    i.actions
  end

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
    f.inputs "Image" do
      f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:xxxhdpi))
    end
    f.actions
  end

  show do |ad|
    attributes_table do
      row :id
      row :name
      row :longitude
      row :latitude
      row :status
      row :score
      row :user
      row :created_at
      row :updated_at
      row :image do
        image_tag(ad.image.url(:original))
      end
    end
    active_admin_comments
  end
end
