class User < ApplicationRecord

  has_secure_password

  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
  validates :password, confirmation:true, presence: true, length: { minimum: 6 }
  validates :email, uniqueness:true, presence: true, allow_blank: false, format: {with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}

  has_attached_file :photo, styles: { small: "64x64", med: "100x100", large: "300x300" }
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }


  has_many :likes, dependent: :delete_all
  has_many :categories, through: :likes

  has_many :investments, dependent: :nullify
  has_many :projects, through: :investments, dependent: :nullify

  has_many :projects,  dependent: :destroy

  has_many :comments, dependent: :delete_all
  has_many :users, through: :comments


  before_destroy :destroy_associations

  def generate_token_and_save
    loop do
      self.token = SecureRandom.hex(64)
      break if save
    end
  end

  
   private
     def destroy_associations
       Project.where(user_id: id).destroy_all
       Comment.where(user_id: id).destroy_all
     end
end
