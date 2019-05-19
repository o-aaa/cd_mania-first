class SongsController < ApplicationController

	def new
	  @song = Song.new
	end

	def create
	  @song = Song.new(song_params)
	  # @product.user_id = current_user.id
	  if @disc.save
	  	flash[:success] = '投稿に成功しました!!!'
	  	redirect_to products_path
      else
     	flash[:danger] = '投稿に失敗しました...'
    	redirect_to products_path
  	  end
	end

  	private

  	def song_params
  	  params.require(:song).permit(:song_title, :track_num )
  	end
end