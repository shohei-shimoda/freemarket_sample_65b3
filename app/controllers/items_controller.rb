class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new    
    @item = Item.new
    @item.images.new
    # @item_image = @item.images.build
    @category_parent_array = []
    parent_origin = [value: 0, name: "---"]
    @category_parent_array << parent_origin
    Category.where(ancestry: nil).each do |parent|
      parent = [value: parent.id, name: parent.name]
      @category_parent_array << parent
  end
  end

  def create
    
    # Item.create(item_params)
    @item = Item.new(item_params)
    # category = Category.find(item_params[:category_id])
    # @category_parent_array = []
    # parent_origin = [value: category.id, name:category.name]
    # @category_parent_array << parent_origin
    # redirect_to root_path
    if @item.save
      # binding.pry
      redirect_to root_path
    else
      render :new
    end
  end

  def show 
  end
  
  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.json
    end
  end
  
  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
    respond_to do |format|
      format.json
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :description, :condition, :delivery_charge, :delivery_area, :delivery_days, :category_id, images_attributes: [:src])
  def create
  end
end
