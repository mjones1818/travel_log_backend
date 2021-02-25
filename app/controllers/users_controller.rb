class UsersController < ApplicationController
  def index

  end

  def create

  end

  def show
    # byebug
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      render json: user, methods: :profile_url, except: :password_digest
    else
      render json: {message: 'this user does not exist'}
    end
  end

  def update
    
  end
end
