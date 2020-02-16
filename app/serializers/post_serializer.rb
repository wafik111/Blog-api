class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :updated_at
  # model association
  has_many :comments
  has_many :tags
end
