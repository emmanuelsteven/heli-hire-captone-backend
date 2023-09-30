class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    respond_to do |format|
      @user = User.new(user_params)

      if @user.save
        format.json { render :show, status: :created, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
