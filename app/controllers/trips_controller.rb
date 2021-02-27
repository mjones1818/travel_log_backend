class TripsController < ApplicationController
  def index

  end

  def create
    trip = Trip.create(country: params[:trip][:country], text: params[:trip][:text])
    user = User.find_by(id: params[:user][:id])
    user.trips << trip
    render json: trip
  end

  def show
    
  end

  def update
    
  end
end
