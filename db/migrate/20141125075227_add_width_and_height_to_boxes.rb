class AddWidthAndHeightToBoxes < ActiveRecord::Migration
  def change
  	add_column :boxes, :width, :integer, default: 302
  	add_column :boxes, :height, :integer, default: 227
  end
end
