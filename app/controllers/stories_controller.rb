class StoriesController < ApplicationController
  before_action :set_story, only: %i[ show edit update destroy ]

  # GET /stories or /stories.json
  def index

    # if search is found call the function
    if params[:search]
      search_table
    end

    # if non is found will force to show all current data?
    @stories = Story.order(params[:sort]).page(params[:page]).per(10)
  end


  # to import CSV

  def import
    Story.import(params[:file])
    redirect_to stories_path, notice: "Stories Added Successfully!"
  end

  #search function

  def search_table
    if @stories = Story.all.find{ |story| story.name.downcase.include?(params[:search].downcase)}
      redirect_to stories_path(@stories)
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def story_params
      params.require(:story).permit(:name, :location, :species, :gender, :affiliations, :weapon, :vehicle)
    end
end
