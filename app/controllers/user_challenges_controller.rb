class UserChallengesController < ApplicationController
  def new
    @challenge = Challenge.find(params[:challenge_id])
    @user_challenge = UserChallenge.new
  end

  def create
    @user_challenge = UserChallenge.create(user_challenge_params)
    if UserChallenge.save
      @user_challenge.user = current_user

  end

private
  def user_challenge_params
    params.require(:challenge).permit(:name, :description, :length, :category)
  end
end
end
