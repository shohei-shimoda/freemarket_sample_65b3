class UsersController < ApplicationController

  def index
  end

  def new
    
  end

  def show
  end



  def edit
  end

  def logout
  end

  def signup1
    @user = User.new
  end

  def signup6
    sign_in User.find(session[:id]) unless user_signed_in?
  end


end
