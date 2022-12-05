module Mutations
    module ArticleMutations
        class UpdateArticle < Mutations::BaseMutation
            argument :title, String, required: true
            argument :body, String, required: true
            argument :id, ID, required: true

            field :article, Types::ArticleType, null: false

            def resolve(title:, body:, id:)
                article = Article.find(id=id)
                article.update!(title: title, body: body, id: id)
                return {article: article}
            rescue ActiveRecord::RecordNotFound => _e
                GraphQL::ExecutionError.new("Article with given ID does not exist: #{id}")
            end
        end
    end
end