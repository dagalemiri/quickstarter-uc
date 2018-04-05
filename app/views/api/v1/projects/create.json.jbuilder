json.project do
  json.id @project.id
  json.name @project.name
  json.description @project.description
  json.goal @project.goal
  json.limit_date @project.limit_date
  json.current @project.current
  json.user do
    json.email @project.user.email
    json.first_name @project.user.first_name
    json.last_name @project.user.last_name
    json.image_url @project.user.image
    json.description @project.user.description
  end
end
