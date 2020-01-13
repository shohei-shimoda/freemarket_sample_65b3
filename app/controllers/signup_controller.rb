class SignupController < ApplicationController
  before_action :validates_new, only: :signup3
  before_action :validates_signup3, only: :signup4
  before_action :validates_signup4, only: :signup5

  def new
    @user = User.new
  end

  def signup3
    @user = User.new 
  end

  def signup4
    @user = User.new
    @address = Address.new
  end

  def signup5
    @user = User.new
    @address = Address.new
  end

  def validates_new
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday_year] = user_params[:birthday_year]
    session[:birthday_month] = user_params[:birthday_month]
    session[:birthday_day] = user_params[:birthday_day]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday_year: session[:birthday_year],
      birthday_month: session[:birthday_month],
      birthday_day: session[:birthday_day],
    )
    render '/signup/new' unless @user.valid?(:validates_new)
  end

  def validates_signup3
    session[:phone_num] = user_params[:phone_num]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday_year: session[:birthday_year],
      birthday_month: session[:birthday_month],
      birthday_day: session[:birthday_day],
      phone_num: session[:phone_num]
    )
    render '/signup/signup3' unless @user.valid?(:validates_signup3)
  end

  def validates_signup4
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:postcode] = params[:user][:addresses][:postcode]
    session[:prefecture_id] = params[:user][:addresses][:prefecture_id]
    session[:city] = params[:user][:addresses][:city]
    session[:house_num] = params[:user][:addresses][:house_num]
    session[:building_name] = params[:user][:addresses][:building_name]
    session[:address_phone_num] = params[:user][:addresses][:address_phone_num]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday_year: session[:birthday_year],
      birthday_month: session[:birthday_month],
      birthday_day: session[:birthday_day],
      phone_num: session[:phone_num]
    )
    @address = Address.new(
      postcode: session[:postcode],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      house_num: session[:house_num],
      building_name: session[:building_name],
      address_phone_num: session[:address_phone_num]
    )
    render '/signup/signup4' unless @address.valid? && @user.valid?(:validates_new)
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday_year: session[:birthday_year],
      birthday_month: session[:birthday_month],
      birthday_day: session[:birthday_day],
      phone_num: session[:phone_num]
    )
    @address = Address.new(
      postcode: session[:postcode],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      house_num: session[:house_num],
      building_name: session[:building_name],
      address_phone_num: session[:address_phone_num]
    )
    if @user.save
      # ログインするための情報を保管
      @address[:user_id] = @user.id
      @address.save
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
    )
    end

    def address_params
      params.require(:user, :addresses).permit(
        work_places_attributes:[:id,:postcode,:prefecture_id,:city,:house_num,:building_name,:address_phone_num]
      )
    end
end
