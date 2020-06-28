class ProductsController < ApplicationController
  def top
    @genres = Genre.all
    @products = Product.joins(:genre).where(genres: {is_actived: "true"}).page(params[:page]).per(4)
    @product_all = Product.all
  end

  def index
  @genres = Genre.all
  if params[:genre_id]
    @genre = Genre.find(params[:genre_id])
    @product_all = Product.where(genre_id: params[:genre_id]).all
    @products = Product.where(on_sale: true).where(genre_id: params[:genre_id]).page(params[:page]).per(8)
  else
    @products = Product.joins(:genre).where(genres: {is_actived: "true"}).page(params[:page]).per(8)
    @product_all = Product.joins(:genre).where(genres: {is_actived: "true"}).all
  end
  end

  def show
  	@genres = Genre.all
  	@product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

end
