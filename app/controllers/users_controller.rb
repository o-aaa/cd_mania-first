class UsersController < ApplicationController
  def index
  	@users = User.all

  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to action: 'index'
  end

  def show
  end

  def new
  end

  def edit
  end


end