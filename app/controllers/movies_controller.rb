class MoviesController < ApplicationController
  before_action :set_movie , only: [:show]
  def index
    @movies = OmdbItem.all.sort_by{|i| i.title}
  end

  def show
    #raise
  end

  private
  def set_movie
    if OmdbItem.where(id: params[:id]).any?
      @movie = OmdbItem.find(params[:id])
    else
      flash[:error] = "record not found"
      redirect_to movies_path
    end
  end

end
