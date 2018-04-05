class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true,
            allow_blank: false
  validates :user_id, presence: true, allow_blank: false
  validates :goal, presence: true, allow_blank: false, numericality: { :greater_than => 0 }
  validates :description, presence: true, allow_blank: true

  has_attached_file :photo, styles: { small: "64x64", med: "100x100", large: "300x300" }
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }


  belongs_to :user

  has_many :comments, dependent: :delete_all
  has_many :projects, through: :comments, dependent: :delete_all

  has_many :investments, dependent: :delete_all
  has_many :users, through: :investments, dependent: :delete_all

  has_many :associates, dependent: :delete_all
  has_many :categories, through: :associates

  before_destroy :destroy_associations


   private

   private
     def destroy_associations
       Comment.where(project_id: id).destroy_all
     end

     def self.search(search)
      if search
        return Project.where('name LIKE ?', "%#{search}%")
      else
        return Project.all
      end
     end

end
