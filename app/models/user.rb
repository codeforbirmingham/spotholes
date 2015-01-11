class User < ActiveRecord::Base
	before_create do |user|
		user.api_key = User.generate_api_key
	end
	attr_accessible :id, :name, :imei, :score
	validates :imei, :score, :name, presence: true
	validates :imei, uniqueness: true

	def self.generate_api_key
		loop do
			token = SecureRandom.base64.tr('0+/=', 'bRat')
			break token unless User.exists?(api_key: token)
		end
	end
end
