# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: false
    field :author_id, Integer, null: false
    field :article_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    
    # The author who've posted this comment
    field :author, Types::AuthorType, null: false
    def author
      return Author.find(id=object.author_id)
    end
    
    # The article that this comment belongs to
    field :article, Types::ArticleType, null: false
    def article
      return Article.find(id=object.article_id)
    end
  end
end
