module Types
  class MutationType < Types::BaseObject
    # Author
    field :add_author, mutation: Mutations::AuthorMutations::AddAuthor
    field :update_author, mutation: Mutations::AuthorMutations::UpdateAuthor

    # Article
    field :add_article, mutation: Mutations::ArticleMutations::AddArticle
    field :update_article, mutation: Mutations::ArticleMutations::UpdateArticle

    # Comment
    field :add_comment, mutation: Mutations::CommentMutations::AddComment
    field :update_comment, mutation: Mutations::CommentMutations::UpdateComment
  end
end
