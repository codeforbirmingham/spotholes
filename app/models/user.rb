class User < ActiveRecord::Base
	attr_accessible :name, :imei, :score
	validates :imei, :score, :name, presence: true
	validates :imei, uniqueness: true
end
