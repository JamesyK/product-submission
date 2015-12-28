class Product < ActiveRecord::Base

	has_many :productimages, dependent: :destroy
	has_many :colors, dependent: :destroy
	has_many :sizes, dependent: :destroy

	accepts_nested_attributes_for :productimages, reject_if: lambda { |a| a[:content].blank? }, allow_destroy: true
	accepts_nested_attributes_for :colors, reject_if: lambda { |a| a[:content].blank? }, allow_destroy: true
	accepts_nested_attributes_for :sizes, reject_if: lambda { |a| a[:content].blank? }, allow_destroy: true

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
