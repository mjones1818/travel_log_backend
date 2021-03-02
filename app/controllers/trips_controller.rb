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
    trip = Trip.find_by(id: params[:id])
    trip.images.attach(params[:images])
    trip.save
    image_urls = trip.image_urls
    render json: trip, methods: :image_urls
  end
end
