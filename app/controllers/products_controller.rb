class ProductsController < ApplicationController
  
  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
    @product.colors.build
    @product.sizes.build
  end

  def create
  	@product = Product.new(product_params)
    params[:images].each { |i| @product.productimages.build(image: i) } if params[:images]
    params[:product][:colors_attributes].each { |c| @product.colors.build(name: c[1][:name], color: c[1][:color]) } if params[:product][:colors_attributes]
    params[:product][:sizes_attributes].each { |s| @product.sizes.build(label: s[1][:label]) } if params[:product][:sizes_attributes]
    if @product.save
  		redirect_to product_path(@product)
  	else
  		render :new
  	end
  end

  protected

  def product_params
  	params.require(:product).permit(
  		:brand, :name, :sku, :description, :price, :images, colors_attributes: [:name, :color], sizes_attributes: [:label]
  	)
  end
  
end
