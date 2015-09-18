class Uploadimage < ActiveRecord::Migration
  def change
  	add_column :users, :bgimage, :string
  end
end
