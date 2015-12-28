class Productimage < ActiveRecord::Base

	belongs_to :product
	
	has_attached_file :image, 
		styles: { large: "403x500#", thumb: "60x60#" }, 
		default_url: "/images/:style/missing.png"

	validates_attachment_content_type :image, content_type: /\Aimage/

end
