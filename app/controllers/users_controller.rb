class UsersController < ApplicationController
  
  def index
  end

  def new 
    render "users/#{params[:name]}"
  end

  def show
  end

  def edit
  end




end
