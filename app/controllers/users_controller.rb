class UsersController < ApplicationController
  def create
    @user_form = UserForm.new(user_params)
    if @user_form.save
      redirect_to root_path, notice: "User created successfully"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password,
                                 :password_confirmation)
  end
end
