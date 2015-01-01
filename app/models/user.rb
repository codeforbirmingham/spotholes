class User < ActiveRecord::Base
	attr_accessible :name, :unique_id, :score
	validates :unique_id, :score, :name, presence: true
	validates :unique_id, uniqueness: true
end
