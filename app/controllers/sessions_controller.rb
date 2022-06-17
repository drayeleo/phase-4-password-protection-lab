class SessionsController < ApplicationController
  # def create
  #   user = User.find_by(username: params[:username])
  #   byebug
  #   session[:user_id] = user.id
  #   render json: user
  # end

  def create
    user = User.find_by(username: params[:username])
    # byebug
    if params[:password] == user.password_digest
      session[:user_id] = user.id
      render json: user #, status: :created
    else
      render json: {
               error: "Invalid username or password"
             },
             status: :unauthorized
    end
  end

  def destroy
    session.delete :user_id
    head :no_content
  end
end
