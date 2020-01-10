class ItemsController < ApplicationController

  def index
    @items_ladies = Item.adjust.active(1)
    @items_mens = Item.adjust.active(212)
    @items_toies = Item.adjust.active(794)
    @items_electricdevices = Item.adjust.active(907)
  
  end

  def new    
    @item = Item.new
    @item.images.new
    @category_parent_array = []
    parent_origin = [value: 0, name: "---"]
    @category_parent_array << parent_origin

    Category.where(ancestry: nil).each do |parent|
      parent = [value: parent.id, name: parent.name]
      @category_parent_array << parent
    end
  end

  def create
    @item = Item.new(item_params)
    @item.seller_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  def show 
    @item= Item.find(params[:id])
  end

  def edit
    @category_parent_array = []
    parent_origin = [value: 0, name: "---"]
    @category_parent_array << parent_origin

    Category.where(ancestry: nil).each do |parent|
      parent = [value: parent.id, name: parent.name]
      @category_parent_array << parent
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item= Item.find(params[:id])
    @item.destroy
    redirect_to root_path
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
    params.require(:item).permit(:name, :price, :description, :condition, :delivery_charge, :delivery_area, :delivery_days, :category_id, images_attributes: [:src, :_destroy])

  end
end
