class Api::SearchController < ApplicationController
  def index
  end

  def item
    render json: OmdbApi::Search.item_by_title(query_params)
  end

  private

  def query_params
    params.require(:query)
  end
end
