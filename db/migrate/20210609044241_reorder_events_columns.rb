class ReorderEventsColumns < ActiveRecord::Migration[6.1]
  def up
    add_column :events, :tmp_column_a, :string
    execute <<-SQL
              UPDATE events
              SET tmp_column_a = location;
            SQL
    remove_column :events, :location
    rename_column :events, :tmp_column_a, :location

    add_column :events, :tmp_column_b, :datetime
    execute <<-SQL
              UPDATE events
              SET tmp_column_b = date;
            SQL
    remove_column :events, :date
    rename_column :events, :tmp_column_b, :date

    add_column :events, :tmp_column_c, :bigint
    execute <<-SQL
              UPDATE events
              SET tmp_column_c = user_id;
            SQL
    remove_column :events, :user_id
    rename_column :events, :tmp_column_c, :user_id

    add_column :events, :tmp_column_d, :datetime, precision: 6, null: false
    execute <<-SQL
              UPDATE events
              SET tmp_column_d = created_at;
            SQL
    remove_column :events, :created_at
    rename_column :events, :tmp_column_d, :created_at

    add_column :events, :tmp_column_e, :datetime, precision: 6, null: false
    execute <<-SQL
              UPDATE events
              SET tmp_column_e = updated_at;
            SQL
    remove_column :events, :updated_at
    rename_column :events, :tmp_column_e, :updated_at
  end
end
