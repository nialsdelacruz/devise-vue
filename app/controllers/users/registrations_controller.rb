# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
   respond_to :json
   private
   def respond_with(resourse, _opts = {})
      regsiter_success && return if resource.persisted?

      register_failed
   end

   def regsiter_success
      render json: {
         message: 'Signed up successfully.',
         user: current_user
      }, status: :ok
   end

   def register_failed
      render json: { message: 'Something went wrong.'}, status: :unprocessable_entity
   end
end