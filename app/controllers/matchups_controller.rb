class MatchupsController < ApplicationController

  def index
    render json: MatchupIndexSerializer.new(@current_user.matchups).serializable_hash.to_json
  end

  def show

  end

  def create

  end

  def update

  end

  def destroy

  end

end