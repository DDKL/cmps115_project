class AddXandYtoBoxes < ActiveRecord::Migration
  def change
  	add_column :boxes, :xCoor, :integer
  	add_column :boxes, :yCoor, :integer
  end
end
