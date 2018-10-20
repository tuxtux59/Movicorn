class WelcomeController < ApplicationController

  def index
    @photosArray = OmdbItem.all.map{|i| url_for(i.poster)}
  end
end
