class MatchupsController < ApplicationController

  def index
    data = {
      matchups: MatchupIndexSerializer.new(@current_user.matchups).serializable_hash,
      teams: TeamSerializer.new(Team.all).serializable_hash
    }
    render json: data.to_json
  end

  def show

  end

  def create
    matchup = @current_user.owned_matchups.build(matchup_params)
    matchup.user_matchups.build(user: @current_user)
    if matchup.save()
      render json: MatchupIndexSerializer.new(matchup).serializable_hash.to_json
    else
      render json: { error: matchup.errors.full_messages }, status: :bad_request
    end
  end

  def update
    matchup = Matchup.find(params[:matchup][:id])
    if exists_and_owner?(matchup)
      if matchup.update(matchup_params)
        render json: MatchupIndexSerializer.new(matchup).serializable_hash.to_json
      else
        render json: { error: matchup.errors.full_messages }, status: :bad_request
      end
    end
  end

  def destroy
    matchup = Matchup.find(params[:id])
    if exists_and_owner?(matchup)
      matchup.destroy()
      render json: { success: "Matchup Destroyed" }
    end
  end

  private

  def matchup_params
    params.require(:matchup).permit(:name, :team_id, :start_date, :end_date, :status)
  end

end