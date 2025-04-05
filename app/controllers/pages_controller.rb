class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :daily_random_challenge, except: [:home]

  def home
  end

  def dashboard
    @challenges = Challenge.all
    @last_2_challenges = UserChallenge.where(user_id: current_user, status: "Completed").last(2)
    @unfinished_2_challenges = UserChallenge.where(user_id: current_user, status: "In Progress").last(2)
  end

  def daily_challenge
    # Set chellenge for demo

    if current_user.category_preference == "Creative Writing"
      @daily_challenge = Challenge.where(name: "Art is Haiku").first
    elsif current_user.category_preference == "Crafting"
      @daily_challenge = Challenge.where(name: "You said it first!").first
    end

    @user_challenge = UserChallenge.new
    # For random challenge

    # @daily_challenge = daily_random_challenge
    # @unfinished = UserChallenge.find_by(user: current_user, challenge: @daily_challenge, status: "In Progress")
    # @completed = UserChallenge.find_by(user: current_user, challenge: @daily_challenge, status: "Completed")
  end

  private

  def daily_random_challenge
    # For random challenge

    # @user_challenges = Challenge.where(length: current_user.length_preference, category: current_user.category_preference)

    # completed_challenges = UserChallenge.where(user_id: current_user, status: "Completed")
    # uncompleted_challenges = []
    # if completed_challenges.count == 0
    #   @user_challenges.sample
    # else
    #   completed_challenges.each do |userchallenge|
    #     uncompleted_challenges << @user_challenges.where.not(id: userchallenge.challenge.id )
    #   end
    #   uncompleted_challenges.flatten.uniq.sample
    # end
  end

end
