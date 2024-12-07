# app/controllers/users/registrations_controller.rb
module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    protected

    # Customize response for successful sign-up
    def respond_with(resource, _opts = {})
      if resource.persisted?
        render json: { message: 'User registered successfully.', user: resource }, status: :created
      else
        render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end
