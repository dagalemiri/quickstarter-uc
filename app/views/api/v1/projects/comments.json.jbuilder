json.array! @comments do |comment|
    json.id comment.id
    json.content comment.content
    json.project_id comment.project_id
    json.project_href api_v1_user_url(comment.project_id)
    json.created_at comment.created_at
end
