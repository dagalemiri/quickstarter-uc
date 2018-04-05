json.user do
  json.id @user.id
  json.href api_v1_user_url(@user)
  json.email @user.email
  json.first_name @user.first_name
  json.last_name @user.last_name
  json.image_url @user.image
  json.description @user.description
end
