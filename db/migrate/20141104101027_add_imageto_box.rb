class AddImagetoBox < ActiveRecord::Migration
  def self.up
    add_attachment :boxes, :image
  end

  def self.down
    remove_attachment :boxes, :image
  end
end