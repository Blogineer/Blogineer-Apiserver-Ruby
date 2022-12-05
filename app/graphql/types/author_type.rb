# frozen_string_literal: true

module Types
  class AuthorType < Types::BaseObject
    field :id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false

    # all articles posted by current author
    field :articles, [Types::ArticleType], null: true
    def articles
      return Article.all.select { |article| article.author == object }
    end

    # all comments posted by current author
    field :comments, [Types::CommentType], null: true
    def comments
      return Comment.all.select { |comment| comment.author == object }
    end
  end
end
