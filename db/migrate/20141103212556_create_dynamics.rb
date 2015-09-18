class CreateDynamics < ActiveRecord::Migration
  def change
    create_table :dynamics do |t|
      t.text :block
      t.timestamps
    end
  end
end
