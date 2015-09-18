class DeleteImageFromBox < ActiveRecord::Migration
  def change
  	remove_attachment :boxes, :image
  end
end
