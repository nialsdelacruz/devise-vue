#app/controllers/members_controller.rb
class MemberController < ApplicationController
   before_action :authenticate_user!

   def def show
      user = get_user_from_token
      render json: {
         message: "If you see this, you're in!",
         user: user
      }
   end

   private
   def get_user_from_toke
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
                     Rails.application.credentials.devise[:jwq_secret_key]).first
      user_id = jwt_payload['sub']
      user = User.find(user_id.to_s)
   end
end