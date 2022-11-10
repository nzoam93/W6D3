class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)
    # replace the `user_attributes_here` with the actual attribute keys
    user.save!
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    # @user = User.find(params[:id])
    render json: @user
  end

  def update
    user = User.find_by(id: params[:id])
    if user.update(user_params)
      redirect_to user_url(user.id)
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    redirect_to users_url #this is plural because it needs the prefix of the index function
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
