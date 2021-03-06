class SessionsController < ApplicationController
  skip_before_action :authenticate_request, only: [:login, :signup]

  def login
    puts params
    command = AuthenticateUser.call(params[:username], params[:password])
    if command.success?
      user = command.result[:user]

      # for dev
      cookies.signed[:jwt] = {value: command.result[:token], httponly: true, same_site: :strict, expires: 1.hour.from_now}

      # for heroku
      #cookies.signed[:jwt] = {value: command.result[:token], httponly: true, same_site: :none, secure: true, expires: 1.hour.from_now}

      render json: UserSerializer.new(user).serializable_hash.to_json
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def signup
    user = User.new(user_params)
    if user.save
      jwt = JsonWebToken.encode(user_id: user.id)

      # for dev
      cookies.signed[:jwt] = {value: jwt, httponly: true, same_site: :strict, expires: 1.hour.from_now}

      # for heroku
      #cookies.signed[:jwt] = {value: jwt, httponly: true, same_site: :none, secure: true, expires: 1.hour.from_now}

      render json: UserSerializer.new(user).serializable_hash.to_json
    else
      render json: {error: user.errors.full_messages}, status: 422
    end
  end

  def logout
    cookies.delete(:jwt)
    render json: { success: "logged out" }
  end

  def dashboard
    render json: { success: 'You made it here!' }
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :name)
  end

end