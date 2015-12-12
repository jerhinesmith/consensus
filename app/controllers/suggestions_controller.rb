class SuggestionsController < ApplicationController
  before_action :set_topic
  before_action :set_suggestion, only: [:show]

  # Get /topics/1/suggestions/1
  def show

  end

  # GET /topics/1/suggestions/new
  def new
    @suggestion = @topic.suggestions.new
  end

  def create
    @suggestion = @topic.suggestions.build(suggestion_params)

    if @suggestion.save
      redirect_to @topic, notice: 'Suggestion was successfully created.'
    else
      render :new
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_suggestion
    @suggestion = @topic.suggestions.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def suggestion_params
    params.require(:suggestion).permit(:title, :description, :created_by)
  end
end
