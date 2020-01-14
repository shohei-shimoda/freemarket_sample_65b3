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

crumb :update do
  link "本人情報の登録", edit_address_path(current_user)
  parent :mypage
end

crumb :card do
  link "クレジットカード登録", new_card_path(current_user)
  parent :mypage
end

crumb :cards do
  link "クレジットカード一覧", cards_path(current_user)
  parent :mypage
end
