class SearchBar < ActiveRecord::Migration
  def change
  	add_column :users, :enableSearchBar, :integer
  end
end
