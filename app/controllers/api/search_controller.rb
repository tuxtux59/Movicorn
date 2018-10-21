class Api::SearchController < ApplicationController
  def index
  end

  def item
    result = OmdbApi::Search.item_by_title(query_params)
    if result.is_a?(JSON)
      render json: result
    elsif result.is_a?(OmdbItem)
      redirect_to movie_path(result)
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  private

  def query_params
    params.require(:query)
  end
end
