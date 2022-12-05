module Mutations
    module AuthorMutations

        # Update an author with given ID
        class UpdateAuthor < Mutations::BaseMutation
            argument :id, ID, required: true
            argument :first_name, String, required: true
            argument :last_name, String, required: true

            field :author, Types::AuthorType, null: false
            field :message, [String], null: true

            def resolve(id:, first_name: nil, last_name: nil)
                author = Author.find(id)
                author.update(id: id, first_name: first_name, last_name: last_name)
                return { author: author }
            rescue ActiveRecord::RecordNotFound => _e
                GraphQL::ExecutionError.new("Author does not exist: #{id}")
            end
        end
    end
end
