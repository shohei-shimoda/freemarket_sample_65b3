class SearchesController < ApplicationController
  def index
    @item = Item.search(params[:search]).limit(132)
    @search = params[:search]

  end
end
