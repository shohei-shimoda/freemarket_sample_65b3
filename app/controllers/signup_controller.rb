class SignupController < ApplicationController
  

  def signup2
    @user = User.new
  end

  def signup3
    session[:user_params] = user_params
    @user = User.new 
  end

  def signup4
    @user = User.new(session[:user_params])
    session[:phone_num] = user_params[:phone_num]
    @user.build_address
  end

  def signup5
    session[:address_attributes] = params[:user][:addresses]
    session[:user_params].merge!(user_params)
    @user = User.new
    @user.build_address
  end

  def create
    @user = User.new(session[:user_params])
    @user.build_address(session[:address_attributes])
    if @user.save
      # ログインするための情報を保管
      session[:id] = @user.id
      redirect_to signup6_users_path
    else
      render '/users/signup1'
    end
  end

  

  private
    # 許可するキーを設定します
    def user_params
      params.require(:user).permit(
        :nickname, 
        :email, 
        :password,  
        :last_name, 
        :first_name, 
        :last_name_kana, 
        :first_name_kana, 
        :birthday_year,
        :birthday_month,
        :birthday_day,
        :phone_num,
        address_attributes: [:id, :postcode, :prefecture_id, :city, :house_num, :building_name],
    )
    end
end
