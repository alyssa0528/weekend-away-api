class Api::AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :update, :destroy]

  def index
    render json: Attraction.all
  end

  def show
    render json: @attraction
  end

  def create
    attraction = Attraction.new(attraction_params)

    if attraction.save
      render json: attraction
    else
      render json: { message: attraction.errors }
    end
  end

  def update
    if @attraction.update(attraction_params)
      render json: @attraction
    else
      render json: { message: @attraction.errors }
    end
  end

  def destroy
    if @attraction.destroy
      render json: { message: "Attraction deleted!" }
    else
      render json: { message: "Deletion failed" }
    end
  end

  def search
    query = params[:query].split.join('-')
    # query of 'new york' would split to ['new', 'york']
    # join would make it 'new-york'
    #binding.pry
    client_id = ENV["CLIENT_ID"]

    client_secret = ENV["CLIENT_SECRET"]

    url = "https://api.foursquare.com/v2/venues/search?near=#{query}&categoryId=4d4b7104d754a06370d81259&client_id=#{client_id}&client_secret=#{client_secret}&v=20160201"

    render
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :street_address, :city, :img_url)
  end

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

end
