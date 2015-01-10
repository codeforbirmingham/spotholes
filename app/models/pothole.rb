class Pothole < ActiveRecord::Base
	attr_accessible :name, :longitude, :latitude, :status, :score
	validates :user, presence: true
	validates :name, :longitude, :latitude, :status, :score, presence: true
	belongs_to :user

	enum status: { unverified: 0, verified: 1, tagged: 2, fixed: 3 }
end
