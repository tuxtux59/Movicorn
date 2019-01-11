class PollsController < ApplicationController
  before_action :set_movie
  before_action :set_movies_poll, only: [:show, :edit, :update, :destroy]

  # GET /movies/polls
  # GET /movies/polls.json
  def index
    @movies_polls = Poll.all
  end

  # GET /movies/polls/1
  # GET /movies/polls/1.json
  def show
  end

  # GET /movies/polls/new
  def new
    @movie_poll = Poll.new(omdb_item: @movie, user: current_user)
  end

  # GET /movies/polls/1/edit
  def edit
  end

  # POST /movies/polls
  # POST /movies/polls.json
  def create
    @movies_poll = Poll.new(movies_poll_params)
    puts @movies_poll
    respond_to do |format|
      if @movies_poll.save
        format.html { redirect_to movie_polls_path(@movie), notice: 'Poll was successfully created.' }
        format.json { render :show, status: :created, location: movie_polls_path(@movie) }
      else
        format.html do
          flash[:error] = @movies_poll.errors.messages
          puts @movies_poll.errors.messages
          redirect_to new_movie_poll_path(@movie)
        end
        format.json { render json: @movies_poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/polls/1
  # PATCH/PUT /movies/polls/1.json
  def update
    respond_to do |format|
      if @movies_poll.update(movies_poll_params)
        format.html { redirect_to @movies_poll, notice: 'Poll was successfully updated.' }
        format.json { render :show, status: :ok, location: @movies_poll }
      else
        format.html { render :edit }
        format.json { render json: @movies_poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/polls/1
  # DELETE /movies/polls/1.json
  def destroy
    @movies_poll.destroy
    respond_to do |format|
      format.html { redirect_to movies_polls_url, notice: 'Poll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_movie
      @movie = OmdbItem.find(params.dig(:movie_id))
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_movies_poll
      @movies_poll = Poll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movies_poll_params
      params.require(:poll).permit(:omdb_item, :user,:omdb_item_id, :user_id, :note, :comment)
    end
end
