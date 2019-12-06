class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request

 def authenticate
   command = AuthenticateUser.call(params[:username], params[:password])
   user = User.find_by({username: params[:username]})

   if command.success?
     render json: { auth_token: command.result, user:{id: user.id, name: user.firstname} }
   else
     render json: { error: command.errors }, status: :unauthorized
   end
 end
end
