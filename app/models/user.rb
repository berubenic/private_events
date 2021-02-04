class User < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  has_many :events, foreign_key: :creator_id
  has_many :invitations
  has_many :attended_events, class_name: 'Event', through: :invitations, source: :event
end
