class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :tags
  accepts_nested_attributes_for :tags
  validates_presence_of :tags
  validates_associated :tags
  after_create do
    CleanPosts.perform_in(24.hours, self.id)
  end

  
end
