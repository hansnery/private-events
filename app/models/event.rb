class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  validates :name, :location, :date, presence: true
  has_many :invitations, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :invitations

  scope :attended, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date > ?', Date.today) }
end
