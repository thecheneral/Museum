class Painting < ActiveRecord::Base
	belongs_to :artist
	belongs_to :gallery

	def self.search(query)
    	self.where("title LIKE :query", query: "%#{query}%")
	end
end
