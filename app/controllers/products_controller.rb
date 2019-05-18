class ProductsController < ApplicationController
  def index
  end

  def show
  end

  def new
  	@product = Product.new
    disc = @product.discs.build
    disc.songs.build
  end

  def create
  	@product = Product.new(product_params)
  	# @product.user_id = current_user.id
	  if @product.save
     flash[:success] = '投稿に成功しました!!!'
     redirect_to products_path
    else
     flash[:danger] = '投稿に失敗しました...'
     redirect_to products_path
    end
	end

  def edit
  end

  private

  def product_params
  	params.require(:product).permit(:image, :artist, :disc_name, :price, :label, :stocks, :genre, :buy_status,
                                      discs_attributes: [
                                         :disc_type, :disc_num, :_destroy, songs_attributes: [:track_num, :song_title, :_destroy]
                                      ] )
  end

end