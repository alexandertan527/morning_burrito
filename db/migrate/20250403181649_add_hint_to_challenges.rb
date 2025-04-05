class AddHintToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_column :challenges, :hint, :text
  end
end
