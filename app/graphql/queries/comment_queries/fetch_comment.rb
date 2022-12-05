module Queries
    module CommentQueries
        class FetchComment < Queries::BaseQuery
            argument :id, ID, required: true

            type Types::CommentType, null: false

            def resolve(id:)
                comment = Comment.find(id=id)
                return comment
            rescue ActiveRecord::RecordNotFound => _e
                GraphQL::ExecutionError.new("Given comment not found: #{id}")
            end
        end
    end
end