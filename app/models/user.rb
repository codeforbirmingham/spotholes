class User < ActiveRecord::Base
	before_create do |user|
		user.api_key = user.generate_api_key
	end
	attr_accessible :name, :imei, :score
	validates :imei, :score, :name, presence: true
	validates :imei, uniqueness: true

	def generate_api_key
		loop do
			token = SecureRandom.base64.tr('+/=', 'Qrt')
			break token unless User.exists?(api_key: token).any?
		end
	end
end
