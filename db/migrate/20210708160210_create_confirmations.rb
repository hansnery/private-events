class CreateConfirmations < ActiveRecord::Migration[6.1]
  def change
    create_table :confirmations do |t|

      t.timestamps
    end
    add_reference :confirmations, :attendee, index: true
    add_reference :confirmations, :attended_event, index: true
  end
end
