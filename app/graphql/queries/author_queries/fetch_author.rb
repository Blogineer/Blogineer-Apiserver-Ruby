module Queries
    module AuthorQueries
        class FetchAuthor < Queries::BaseQuery
            type Types::AuthorType, null: false
    
            # An argument named id with type ID is required for this query
            argument :id, ID, required: true
    
            def resolve(id: ID)
                author = Author.find(id=id)
                rescue ActiveRecord::RecordNotFound => _e
                    GraphQL::ExecutionError.new('Author does not exist.')
                rescue ActiveRecord::RecordInvalid => _e
                    GraphQL::ExecutionError.new("Invalid attributes for #{_e.record.class}:" \
                    " #{_e.record.errors.full_messages.join(', ')}")
                return author
            end
        end
    end
end