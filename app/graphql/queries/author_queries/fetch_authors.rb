module Queries
    module AuthorQueries
        class FetchAuthors < Queries::BaseQuery
            # Declares that this class will return an array of AuthorType
            type [Types::AuthorType], null: false
            
            def resolve
                authors = Author.all.order(created_at: :desc)
                return authors
            end
        end
    end
end