class DiscsController < ApplicationController

	def new
		@disc = Disc.new
	end

	def create
  	  @disc = Disc.new(disc_params)
  	  # @product.user_id = current_user.id
	  if @disc.save
	   	flash[:success] = '投稿に成功しました!!!'
      	redirect_to products_path
      else
       	flash[:danger] = '投稿に失敗しました...'
       	redirect_to products_path
      end
	end

  def edit
    @disc = Disc.find(params[:id])
  end
  def update
    disc = Disc.find(params[:id])
    if disc.update(disc_params)
       flash[:success] = '編集に成功しました!!!'
       redirect_to product_path(product.id)
    else
      flash[:danger] = '編集に失敗しました...'
      redirect_to product_path(product.id)
    end
  end

  	private

  	def disc_params
  		params.require(:disc).permit(:disc_type, :disc_num,
                                    songs_attributes: [:track_num, :song_title, :_destroy])
 	 end

end

