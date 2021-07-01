class ChangeDefaultValueOfEventBoolean < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :private, :boolean, :default => false
  end
end
