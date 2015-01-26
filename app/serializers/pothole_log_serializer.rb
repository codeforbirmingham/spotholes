class PotholeLogSerializer < ActiveModel::Serializer
  attributes :name, :status, :created_at

  def name
    if object.admin_user_id.blank?
      User.find(object.user_id).name
    else
      AdminUser.find(object.admin_user_id).name
    end
  end
end