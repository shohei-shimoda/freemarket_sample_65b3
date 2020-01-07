crumb :root do
  link "フリーマーケット", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user)
end

crumb :profile do
  link "プロフィール", edit_user_path(current_user)
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end
