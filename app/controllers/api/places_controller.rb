class Api::PlacesController < ApplicationController

  def index
    @places = Place.all
    render 'index.json.jbuilder'
  end

  def show
    @place = place.find(params[:id]) #one place hash
    render 'show.json.jbuilder'
  end

  def create
    @place = place.new(
      name: params[:name],
      address: params[:address],
    )
    if @place.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @place.errors.full_messages}, status: 422
    end
  end

  def update
    @place = place.find(params[:id])

    @place.title = params[:title] || @place.title
    @place.prep_time = params[:prep_time] || @place.prep_time
    @place.ingredients = params[:ingredients] || @place.ingredients
    @place.directions = params[:directions] || @place.directions
    @place.image_url = params[:image_url] || @place.image_url

    if @place.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @place.errors.full_messages}, status: 422
    end
  end

  def destroy
    @place = place.find(params[:id])
    @place.destroy
    render json: {message: "Place successfully destroyed!"}
  end

end
