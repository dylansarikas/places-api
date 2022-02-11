class PlacesController < ApplicationController

  def index
    places = Place.all
    render json: places
  end

  def create
    places = Place.new(
      name: params[:name],
      address: params[:address]
    )
    if places.save
      render json: places
    else
      render json: {errors: places.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    places = Place.find(params[:id])
    render json: places
  end

  def update
    places = Place.find(params[:id])
    places.name = params[:name] || places.name
    places.address = params[:address] || places.address
    if places.save
      render json: places
    else
      render json: {errors: places.errors.full_messages}, status: :unprocessable_entity
    end
  end
  
  def destroy
    places = Place.find(params[:id])
    places.destroy
    render json: { message: "Destroyed Place" }
  end

end
