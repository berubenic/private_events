class User < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  has_many :events, foreign_key: :creator_id
  has_many :invitations
  has_many :pending_events, -> { where(invitations: { status: 0 }) }, class_name: 'Event', through: :invitations, source: :event
  has_many :attended_events, -> { where(invitations: { status: 1 }) }, class_name: 'Event', through: :invitations, source: :event
  has_many :declined_events, -> { where(invitations: { status: 2 }) }, class_name: 'Event', through: :invitations, source: :event
end
