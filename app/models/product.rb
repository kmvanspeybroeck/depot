# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  image_url   :string(255)
#  price       :decimal(8, 2)
#  created_at  :datetime
#  updated_at  :datetime
#

#def self.latest
#  Product.order(:updated_at).last
#end

class Product < ActiveRecord::Base
	def self.latest
	  Product.order(:updated_at).last
	end
	validates :title, :description, :image_url, presence: true
	validates :title, length: { minimum: 10, message: "title must be at least 10 characters long"}
	validates :price, numericality:  {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with:  %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
	}
end
