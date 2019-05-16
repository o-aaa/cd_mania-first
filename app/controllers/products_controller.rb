class ProductsController < ApplicationController
  def index
  	@products = Product.page(params[:page]).reverse_order
  end

  def show
  end

  def new
  end

  def edit
  end
end
