class AddDescToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :desc, :string
  end
end
