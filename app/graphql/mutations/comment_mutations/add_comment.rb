module Mutations
    module CommentMutations
        class AddComment < Mutations::BaseMutation
            argument :content, String, required: true
            argument :author_id, ID, required: true
            argument :article_id, ID, required: true

            field :comment, Types::CommentType, null: false

            def resolve(content:, author_id:, article_id:)
                Author.find(id=author_id)
                Article.find(id=article_id)
                comment = Comment.create!(content: content, 
                                          author_id: author_id, 
                                          article_id: article_id)
                return { comment: comment }
            rescue ActiveRecord::RecordNotFound => _e
                GraphQL::ExecutionError.new("Author or Article not found")
            end
        end
    end
end