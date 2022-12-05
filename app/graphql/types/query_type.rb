module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Author
    field :fetch_authors, resolver: Queries::AuthorQueries::FetchAuthors
    field :fetch_author, resolver: Queries::AuthorQueries::FetchAuthor

    # article
    field :fetch_articles, resolver: Queries::ArticleQueries::FetchArticles
    field :fetch_article, resolver: Queries::ArticleQueries::FetchArticle

    # comment
    field :fetch_comment, resolver: Queries::CommentQueries::FetchComment
  end
end
