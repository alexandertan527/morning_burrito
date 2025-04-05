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


Challenge.destroy_all
User.destroy_all

p "Creating challenges..."
# challenges.each { |challenge| Challenge.create!(challenge) }
# p "Created #{Challenge.count} challenges"

challenges.each do |challenge|
  new_challenge = Challenge.new(challenge)
  if new_challenge.name == "Sketching what's in your brain"
    file = URI.parse("https://res.cloudinary.com/dgzyaqbk4/video/upload/v1743103987/BB_39cb8e8f-98f2-476f-bba6-0f9e8dcd9336_h9yhik.mp4").open
    new_challenge.video.attach(io: file, filename: "sketchvideo.mp4", content_type: "video/mp4")
  elsif new_challenge.name == "Sketching your selfie"
    file = URI.parse("https://res.cloudinary.com/dgzyaqbk4/video/upload/v1743103943/A026_05301042_C003_V1-0016_2_mvgxpt.mp4").open
    new_challenge.video.attach(io: file, filename: "sketchvideo.mp4", content_type: "video/mp4")
  end
  new_challenge.save!
end

myUser = User.create(first_name:"pat", category_preference: "Crafting", length_preference: "6", email: "junior@email.com", password: "password")
 p "Challnge created"
