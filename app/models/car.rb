class Car < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	has_attached_file :car_img, styles: { :car_index => "250x350>", :car_show => "325x475>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :car_img, content_type: /\Aimage\/.*\Z/
end
