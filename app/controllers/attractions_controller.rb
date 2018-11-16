class AttractionsController < ApplicationController

  def search
    query = params[:query]

    client_id = ENV["CLIENT_ID"]

    client_secret = ENV["CLIENT_SECRET"]

    url = "https://api.foursquare.com/v2/venues/search?near=#{query}&categoryId=4d4b7104d754a06370d81259&client_id=#{client_id}&client_secret=#{client_secret}&v=20160201"

    render "Hello"
  end

end
