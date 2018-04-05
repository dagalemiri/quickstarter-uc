class Category < ApplicationRecord
  has_many :likes
  has_many :users, through: :likes

  has_many :associates, dependent: :delete_all
  has_many :projects, through: :associates, dependent: :delete_all
end
