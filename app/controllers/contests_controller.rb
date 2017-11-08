class ContestsController < ApplicationController
  before_action :set_contest, only: [:show, :update, :destroy]
  before_action :set_contest_type, only: :create

  # GET /contests
  def index
    @contests = Contest.all

    render json: @contests
  end

  # GET /contests/1
  def show
    render json: @contest
  end

  # POST /contests
  def create
    @contest = @contest_type.new(contest_params)

    if @contest.save
      render json: @contest.as_json(only: :id), status: :created
    else
      render json: @contest.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contest
      @contest = Contest.find(params[:id])
    end

    def set_contest_type
      if Contest.contest_types.map(&:downcase).exclude? params[:type].to_s.downcase
        render status: :not_found
      else
        @contest_type = "Contests::#{params[:type].classify}".constantize
      end
    end

    # Only allow a trusted parameter "white list" through.
    def contest_params
      params.require(:contest).permit(contestant_one: {}, contestant_two: {})
    end
end
