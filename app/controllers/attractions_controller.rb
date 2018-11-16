class AttractionsController < ApplicationController

  def search
    query = params[:query]

    url = "https://api.foursquare.com/v2/venues/search?near=#{query}&categoryId=4d4b7104d754a06370d81259"
  end

end
