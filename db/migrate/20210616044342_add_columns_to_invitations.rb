class AddColumnsToInvitations < ActiveRecord::Migration[6.1]
  def change
    add_column :invitations, :attendee_id, :bigint
    add_column :invitations, :attended_event_id, :bigint
    add_foreign_key :invitations, :users, column: :attendee_id
    add_foreign_key :invitations, :events, column: :attended_event_id
  end
end
