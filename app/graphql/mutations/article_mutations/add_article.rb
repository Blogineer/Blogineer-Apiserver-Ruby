module Mutations
    module ArticleMutations

        # Create an article posted by given author.
        # Note: invalid author will cause error
        class AddArticle < Mutations::BaseMutation
            argument :title, String, required: true
            argument :body, String, required: true
            argument :author_id, ID, required: true

            field :article, Types::ArticleType, null: false

            def resolve(title: String, body: String, author_id: ID)
                author = Author.find(id=author_id)
                article = Article.create!(title: title, body: body, author_id: author_id)
                return { article: article }
            rescue ActiveRecord::RecordNotFound => _e
                GraphQL::ExecutionError.new("Author with given ID does not exist: #{author_id}")
            end
        end
    end
end