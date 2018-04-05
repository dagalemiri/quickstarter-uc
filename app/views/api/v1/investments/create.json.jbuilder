json.investment do
    json.id @investment.id
    json.amount @investment.amount
    json.user_id @investment.user_id
    json.project_id @investment.project_id
end