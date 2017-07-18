class Product < ApplicationRecord
	has_many :images
	has_many :tags
	has_many :categories

	accepts_nested_attributes_for :tags
	accepts_nested_attributes_for :categories
	accepts_nested_attributes_for :images
end