class Invitation < ApplicationRecord
  belongs_to :invited_user, class_name: 'User', foreign_key: 'invited_user_id'
  belongs_to :invited_event, class_name: 'Event', foreign_key: 'invited_event_id'
end
