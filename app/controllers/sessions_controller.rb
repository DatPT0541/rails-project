class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i(create)

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = JwtService.encode(
        user_id: user.id,
        role: user.role,
        email: user.email
      )
      render json: {token:}, status: :ok
    else
      render json: {error: "Invalid email or password"}, status: :unauthorized
    end
  end
end
