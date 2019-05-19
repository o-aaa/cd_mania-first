class UsersController < ApplicationController
  def index
  end

  def show
  	@user = User.find(params[:id])
  	@address = Address.find_by(id[:user_id])
  end

  def new
  end

  def edit
  end
end