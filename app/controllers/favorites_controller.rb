class FavoritesController < ApplicationController
  def index
    @user = current_user
    @favorites = @user.favorites.page(params[:page]).per(10)
  end

  def destroy
    favorite = favorites.find(params[:id])
    favorit.destroy
    redirect_to action: 'index'
  end
end
