module Queries
    module ArticleQueries
        class FetchArticles < Queries::BaseQuery
            type [Types::ArticleType], null:false

            def resolve
                Article.all.order(created_at: :desc)
            end
        end
    end
end
