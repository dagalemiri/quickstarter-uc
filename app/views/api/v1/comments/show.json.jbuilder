json.comment do
    json.id @comment.id
    json.content @comment.content
    json.user_id @comment.user_id
    json.user_href api_v1_user_url(@comment.user_id)
    json.project_id @comment.project_id
    json.project_href api_v1_project_url(@comment.project_id)
    json.created_at @comment.created_at
end
