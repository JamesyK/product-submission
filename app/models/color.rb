class Color < ActiveRecord::Base

	belongs_to :product

	validates :color, presence: true
	validates :name, presence: true
	
end
