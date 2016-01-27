class AddDescription < ActiveRecord::Migration
  def change
    change_table :recommendations do |t|
      t.string :description
    end
  end
end
