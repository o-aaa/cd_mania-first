class ProductsController < ApplicationController
  def index
  	@products = Product.page(params[:page]).reverse_order

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
    @product = Product.find(params[:id])
  end
  def update
    product = Product.find(params[:id])
    if product.update(product_params)
       flash[:success] = '編集に成功しました!!!'
       redirect_to product_path(product.id)
    else
      flash[:danger] = '編集に失敗しました...'
      redirect_to product_path(product.id)
    end
  end

  private

  def product_params
  	params.require(:product).permit(:image, :artist, :product_name, :price, :label, :release_date, :stocks, :genre, :buy_status,
                                      discs_attributes: [
                                         :id,:disc_type, :disc_num, :_destroy, songs_attributes: [:id,:track_num, :song_title, :_destroy]
                                      ] )
  end

end