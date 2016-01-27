class UpdateLikesRecommendations < ActiveRecord::Migration
  def change
    change_table :recommendations do |t|
      t.integer :likes, :default => 1
    end
  end
end
