class ProductsController < ApplicationController
  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
	
	@current_user ||= User.find(session[:user_id]) if session[:user_id]

  	@product.email = @current_user.email

  	if @product.save
  		redirect_to root_url, :notice => "Product Create Successfully"
  	else
  		render "new"
  	end
  end

  private
  def product_params
    params.require(:product).permit(:productname,:productdes)
  end

end
