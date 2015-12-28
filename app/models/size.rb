class Size < ActiveRecord::Base

	belongs_to :product

	validates :label, presence: true
	
end
