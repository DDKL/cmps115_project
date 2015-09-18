class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.belongs_to :user
      t.belongs_to :url
      t.boolean :isDynamic
      t.timestamps
      t.string :username
      t.string :pw
    end
  end
end
