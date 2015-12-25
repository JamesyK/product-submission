class Productimage < ActiveRecord::Base

	belongs_to :product
	has_attached_file :image,
		styles: { large: "403x500", thumb: "80x80" },
		path: ":rails_root/public/images/:id/:filename",
		url: "/images/:id/:filename"

	do_not_validate_attachment_file_type :image

end
