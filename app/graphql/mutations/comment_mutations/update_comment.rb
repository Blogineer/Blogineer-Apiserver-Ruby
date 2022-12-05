module Mutations
    module CommentMutations
        class UpdateComment < Mutations::BaseMutation
            argument :id, ID, required: true
            argument :content, String, required: true

            field :comment, Types::CommentType, null: false

            def resolve(id:, content:)
                comment = Comment.find(id=id)
                comment.update!(content: content)
                return { comment: comment }
            rescue ActiveRecord::RecordNotFound => _e
                GraphQL::ExecutionError.new("Given comment not found: #{id}")
            end
        end
    end
end