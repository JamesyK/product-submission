class Product < ActiveRecord::Base

	has_many :productimages, dependent: :destroy
	accepts_nested_attributes_for :productimages, reject_if: lambda { |a| a[:content].blank? }, allow_destroy: true

	validates :brand, presence: true
	validates :name, presence: true
	validates :description, presence: true
	validates :sku, presence: true, uniqueness: true
	validate :price_is_num

	protected

	def price_is_num
		errors.add(:price, "should be atleast 0.01") if price.nil? || price < 0.01
	end
end
