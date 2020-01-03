class ItemsController < ApplicationController

  def index
    @images = Image.all
    @items = Item.all
  end

  def new
  end

  def show 
  end
  
end
