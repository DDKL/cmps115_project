class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.belongs_to :dynamic
      t.string :link
      t.timestamps
    end
  end
end
