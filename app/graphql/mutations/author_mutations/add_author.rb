module Mutations
    module AuthorMutations
        
        # Mutation that create an author
        class AddAuthor < Mutations::BaseMutation
            argument :params, Types::Input::AuthorInputType, required: true
            
            field :author, Types::AuthorType, null: false

            def resolve(params:)
                author_params = Hash params
                author = Author.create!(author_params)
                return { author: author }
            rescue ActiveRecord::RecordInvalid => _e
                GraphQL::ExecutionError.new("Invalid attributes for #{_e.record.class}:"\
                    " #{_e.record.errors.full_messages.join(', ')}")
            end

        end
    end
end