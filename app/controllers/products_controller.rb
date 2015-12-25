class ProductsController < ApplicationController
  
  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
    @product.productimages.build
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
      if params[:images]
        params[:images].each { |i| @product.productimages.create(image: i) }
      end
  		redirect_to products_path
  	else
  		render :new
  	end
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to products_path
  end

  protected

  def product_params
  	params.require(:product).permit(
  		:brand, :name, :sku, :description, :price, :images
  	)
  end
end
