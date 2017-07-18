class Api::V1::ProductsController < ApplicationController

	def create
		@product = Product.new(product_params)
		if @product.valid? && @product.save
			@tags = params[:tags]
			if @tags.present?
				@tags.each do |tag|
					@product.tags.create(:product_id => @product.id, :name => tag)
				end
			end
			@categories = params[:categories]
			if @categories.present?
				@categories.each do |category|
					@product.categories.create(:product_id => @product.id, :name => category)
				end
			end
			@images = params[:images]
			if @images.present?
				@images.each do |image|
					image.each do |key, value|
						@product.images.create(:product_id => @product.id, :img_path => value)
					end
				end
			end
  			render json: { success: true }
		else
			render json: { success: false, errors: @product.errors.full_messages }
		end
	end

	def update
		@product = Product.find(params[:id]).assign_attributes(product_params)
		if @product.valid? && @product.save
  			render json: { success: true }
		else
			render json: { success: false, errors: @product.errors.full_messages }
		end
	end

	def show
		@product = Product.find(params[:id])
		render json: @product, :include => {:tags => {:only => :name}, :categories => {:only => :name}, :images => {:only => :img_path}}
	end

	private
	def product_params
		params.require(:product).permit(:name, :expire_date, :price, {tags:[]}, {categories:[]}, {images:[:img_path]})
	end

end