class User < ApplicationRecord
  has_person_name
  has_many :events, inverse_of: 'creator'
  has_many :invitations, foreign_key: :attendee_id
  has_many :attended_events, through: :invitations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
