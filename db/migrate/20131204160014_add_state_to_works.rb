class AddStateToWorks < ActiveRecord::Migration
  def change
    add_column :works, :state, :string
    add_index :works, :state
  end
end
