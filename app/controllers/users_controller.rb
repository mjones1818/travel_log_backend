class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def index

  end

  def create
    user = User.create(name: params[:name], password: params[:password])
    render json: user
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
    # byebug
    user = User.find(params[:id])
    user.update(profile: params[:profilePic])
    profile_url = rails_blob_path(user.profile)
    # render json: {user: user, profile_url: profile_url}
    render json: user, methods: :profile_url, except: :password_digest
  end

end
