class WelcomeController < ApplicationController

  def index
    @photosArray = OmdbItem.all.map(&:poster_url)
  end
end
