# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to items_path
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render '/users/password/new'
    end
  end
end
