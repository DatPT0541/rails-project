module Authenticable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
  end

  def authenticate_user!
    if request.headers["Authorization"]
      token = request.headers["Authorization"].split(" ").last
    end
    decoded_token = JwtService.decode token
    if decoded_token && User.exists?(decoded_token[:user_id])
      @current_user = User.find decoded_token[:user_id]
    else
      render json: {error: "Unauthorized"}, status: :unauthorized
    end
  end

  def authenticate_admin!
    return if @current_user.admin?

    render json: {error: "Forbidden: Admins only"}, status: :forbidden
  end

  def authenticate_owner! resource_id
    return if @current_user&.id == resource_id.to_i

    render json: {error: "Forbidden: Access denied"}, status: :forbidden
  end
end
