# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require_relative "data/challenges"
require "open-uri"

p "Deleting all challenges and users..."
Challenge.destroy_all
User.destroy_all
p "All challenges and users have been deleted"

p "Creating challenges..."
challenges.each do |challenge|
  new_challenge = Challenge.new(challenge)
  new_challenge.save!
end
p "Challenge created"

p "Creating user..."
myUser = User.create(first_name:"pat", email: "junior@email.com", password: "password")
p "User created"

p "Creating User Challenges..."
userChallenge1 = UserChallenge.new(user: User.where(email: "junior@email.com").first, challenge: Challenge.where(name: "Everyday art!").first, status: "Completed", completion_date: Time.now - 86400, challenge_text: "A willow tree stands gracefully by the water's edge, its long, slender branches cascading downward like delicate green curtains swaying in the breeze. The trunk is slightly twisted and pale gray, with rough bark that peels in places to reveal smoother wood beneath. Its narrow leaves shimmer with silvery-green hues, fluttering softly and creating a calming rustle with even the gentlest wind. Beneath its sweeping canopy, the air feels hushed and cool, offering a serene, almost dreamlike shelter from the world outside.")
userChallenge2 = UserChallenge.new(user: User.where(email: "junior@email.com").first, challenge: Challenge.where(name: "Found Poetry!").first, status: "Completed", completion_date: Time.now - 172800, challenge_text: "Beneath the shell of evening's hush,
She roasts potatoes, warm and lush,
A touch of herbs, a tender grace,
Filling the night with home's embrace.")
userChallenge3 = UserChallenge.new(user: User.where(email: "junior@email.com").first, challenge: Challenge.where(name: "Emoji Storytelling").first, status: "In Progress")
userChallenge1.save!
userChallenge2.save!
userChallenge3.save!
p "User Challenges created"
