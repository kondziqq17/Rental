class Category < ActiveRecord::Base
	has_many :cars

	validates :category, presence: true
end
