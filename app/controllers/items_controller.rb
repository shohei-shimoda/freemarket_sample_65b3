class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
  end

  def show 
  end
  
  def create
  end
end
