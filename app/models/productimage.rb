class Productimage < ActiveRecord::Base

	belongs_to :product
	has_attached_file :image, 
		styles: { large: "403x500#", thumb: "60x60#" }, 
		default_url: "/images/:style/missing.png"

	do_not_validate_attachment_file_type :image

end
