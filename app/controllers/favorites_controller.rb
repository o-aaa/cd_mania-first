class FavoritesController < ApplicationController
  def index
    @user = current_user
    @favorite = @user.favorites.page(params[:page]).per(10).reverse_order

  end

  def create
  	product = Product.find(params[:product_id])
  	favorite = current_user.favorites.new(product_id: product.id)
  	favorite.save
  	redirect_to product_path(product)
  end

  def destroy
  	product = Product.find(params[:product_id])
  	favorite = current_user.favorites.find_by(product_id: product.id)
  	favorite.destroy
    # 同一ページへリダイレクトする！
  	redirect_back(fallback_location: root_path)
  end

end
