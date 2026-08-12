class ShoppingcartController < ApplicationController

  def index
    @categories = get_response("https://fakestoreapi.com/products/categories").prepend("All Categories")
    @products = get_response("https://fakestoreapi.com/products")
  end

  def product_list
    category_name = params[:category]

    url = if category_name.blank? || category_name == "All Categories"
      "https://fakestoreapi.com/products"
    else
      "https://fakestoreapi.com/products/category/#{ERB::Util.url_encode(category_name)}"
    end

    @products = get_response(url)
  end

  def add_cart
    @product = get_response("https://fakestoreapi.com/products/#{params[:product_id]}")
  end

  def remove_cart
    product_id = params[:cart_id]
    @product = get_response("https://fakestoreapi.com/products/#{product_id}")
  end

  private
  def get_response(url)
    response = HTTParty.get(url)
    response.success? ? response : []
  end


end
