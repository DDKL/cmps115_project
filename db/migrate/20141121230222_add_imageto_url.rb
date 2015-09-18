class AddImagetoUrl < ActiveRecord::Migration
  def self.up
    add_attachment :urls, :image
  end

  def self.down
    remove_attachment :urls, :image
  end
end
