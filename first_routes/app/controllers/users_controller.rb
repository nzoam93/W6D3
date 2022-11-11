#any method in controller is fed in params (a hash of info)
class UsersController < ApplicationController
  def index
    # if params[:username] #assuming that the query key is username
    #   users = User.where('username = ?',params[:username])
    # else
    #   users = User.all
    # end

    only_user = params.permit(:username)
    if params[:username] #assuming that the query key is username
      users = User.where(only_user)
    else
      users = User.all
    end

    render json: users
  end

  def create
    user = User.new(user_params)
    # replace the `user_attributes_here` with the actual attribute keys
    # user.save!
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

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
