# frozen_string_literal: true

module Types
  class ArticleType < Types::BaseObject
    field :id, ID, null: false
    field :author_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :title, String, null: false
    field :body, String, null: false

    # The author who posted this article
    field :author, Types::AuthorType, null: false
    def author
      return Author.find(id=object.author_id)
    end

    # all comments against current article
    field :comments, [Types::CommentType], null: true
    def comments
      return Comment.all.select{ |comment| comment.article == object}
    end
  end
end
