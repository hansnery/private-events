class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  validates :name, :location, :date, presence: true
  has_many :invitations, foreign_key: :invited_event_id, dependent: :destroy
  has_many :invited_users, through: :invitations
  has_many :confirmations, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :confirmations

  scope :attended, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date > ?', Date.today) }
end
