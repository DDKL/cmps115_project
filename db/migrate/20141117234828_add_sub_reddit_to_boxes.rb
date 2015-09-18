class AddSubRedditToBoxes < ActiveRecord::Migration
  def change
  	add_column :boxes, :subReddit, :string, default: "/"
  end
end
