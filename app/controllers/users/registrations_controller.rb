class Users::RegistrationsController < Devise::RegistrationsController
  def create
    #binding.pry
     if params[:user][:password] == "" #sns登録なら
       params[:user][:password] = "Devise.friendly_token.first(6)" #deviseのパスワード自動生成機能を使用
       params[:user][:password_confirmation] = "Devise.friendly_token.first(6)"
       super
       # binding.pry
       sns = SnsCredential.update(user_id:  @user.id)
     else #email登録なら
       # binding.pry
       super
     end
   end
  end
