class Investment < ApplicationRecord
  validates :amount, presence: true, allow_blank: false, :numericality => { greater_than: 0, less_than: 1000000}
  validates :user_id, presence: true
  validates :project_id, presence: true


  belongs_to :user
  belongs_to :project

  after_create :create_project_amount
  before_destroy :less_project_amount
  before_update :less_project_amount
  after_update :create_project_amount



   private
     def create_project_amount
       project = Project.find(project_id)
       project[:current] += amount
       project.save
     end
     def less_project_amount
       project = Project.find(project_id)
       inv = Investment.find(id)
       project[:current] -= inv[:amount]
       project.save
     end

end
