module Queries
    module ArticleQueries
        class FetchArticle < Queries::BaseQuery
            type Types::ArticleType, null:false
    
            # An argument named id with type ID is required for this query
            argument :id, ID, required: true

            def resolve(id: ID)
                article = Article.find(id=id)
                rescue ActiveRecord::RecordNotFound => _e
                    GraphQL::ExecutionError.new('Article does not exist.')
                rescue ActiveRecord::RecordInvalid => _e
                    GraphQL::ExecutionError.new("Invalid attributes for #{_e.record.class}:" \
                    " #{_e.record.errors.full_messages.join(', ')}")
                return article
            end
        end
    end
end
