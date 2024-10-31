class UsersController < ApplicationController
  include Authenticable

  # before_action :authenticate_admin!, only: %i(show)
  before_action ->{authenticate_owner!(params[:id])}, only: %i(show)

  def show
    @user = User.find_by(id: params[:id])

    if @user
      render json: {id: @user.id,
                    name: @user.name,
                    email: @user.email},
             status: :ok
    else
      render json: {error: "User not found"}, status: :not_found
    end
  end
end
