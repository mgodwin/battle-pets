class ContestTypesController < ApplicationController

  def index
    @types = Contest.contest_types

    render json: @types, status: :ok
  end
end
