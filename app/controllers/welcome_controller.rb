class WelcomeController < ApplicationController

  def index
    @photosArray = OmdbItem.all.select{|i| i.poster.attached?}.map{|i| url_for(i.poster)}
  end
end
