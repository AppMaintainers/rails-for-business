class ChangeDefaultFalseToBusiness < ActiveRecord::Migration
  def change
    change_column :tasks, :business, :boolean, :null => false, :default => false
  end
end
