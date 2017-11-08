class ContestEventsController < ApplicationController
  before_action :set_contest
  def index
    @events = @contest.events.order(created_at: :asc)
    @events = @events.where("id > ?", params[:last_id]) if params[:last_id].present?

    render json: @events, status: :ok
  end

  private

  def set_contest
    @contest = Contest.find(params[:id])
  end
end
