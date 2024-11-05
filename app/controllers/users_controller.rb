class UsersController < ApplicationController
  include Authenticable

  # before_action :authenticate_admin!, only: %i(index)
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

  def index
    name = params[:name]

    # SELECT * FROM users WHERE name = 'John' OR '1'='1';
    @users = User.where("name = '#{name}'")
    # @users = User.where(name:)

    render json: @users.map{|user|
      {
        id: user.id,
        name: user.name,
        email: user.email
      }
    }
  end
end
