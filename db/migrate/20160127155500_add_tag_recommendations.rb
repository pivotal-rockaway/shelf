class AddTagRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :tag, :string
  end
end
