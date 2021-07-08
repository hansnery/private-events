class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|

      t.timestamps
    end
    add_reference :invitations, :invited_user, index: true
    add_reference :invitations, :invited_event, index: true
  end
end
