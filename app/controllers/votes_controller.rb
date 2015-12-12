class VotesController < ApplicationController
  before_action :set_topic

  # Get /topics/1/votes
  def index
    @votes        = @topic.votes
    @suggestions  = Hash[@topic.suggestions.pluck(:id, :title)]
  end

  # GET /topics/1/votes/new
  def new
    @vote        = @topic.votes.new
    @suggestions = @topic.suggestions
  end

  def create
    @vote = @topic.votes.build(vote_params)

    if @vote.save
      redirect_to @topic, notice: 'Vote was successfully created.'
    else
      render :new
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  # Only allow a trusted parameter "white list" through.
  def vote_params
    params.require(:vote).permit(:created_by, :suggestion_ids_string)
  end
end
