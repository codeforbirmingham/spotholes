class PotholeLog < ActiveRecord::Base
  attr_accessible :user_id, :admin_user_id, :pothole_id, :status, :created_at

  belongs_to :pothole
end