module Types
    module Input
      class AuthorInputType < Types::BaseInputObject
        argument :first_name, String, required: true
        argument :last_name, String, required: true
      end
    end
  end