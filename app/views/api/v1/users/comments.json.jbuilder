json.array! @comments do |comment|
    json.id comment.id
    json.content comment.content
    json.project_id comment.project_id
    json.created_at comment.created_at
end