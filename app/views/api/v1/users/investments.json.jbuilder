json.array! @investments do |investment|
    json.id investment.id
    json.amount investment.amount
    json.user_id investment.user_id
    json.user_href api_v1_user_url(investment.user_id)
    json.project_id investment.project_id
    json.project_href api_v1_project_url(investment.project_id)

end
