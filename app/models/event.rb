class Event < ApplicationRecord
  validates :name, :body, :location, :date, presence: true
  validates :name, :location, length: { maximum: 25 }
  validates :body, length: { minimum: 10 }

  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :invitations, dependent: :destroy
  has_many :pending_attendees, -> { where(invitations: { status: 0 }) }, class_name: 'User', through: :invitations, source: :user, dependent: :destroy
  has_many :attendees, -> { where(invitations: { status: 1 }) }, class_name: 'User', through: :invitations, source: :user, dependent: :destroy
  has_many :declined_attendees, -> { where(invitations: { status: 2 }) }, class_name: 'User', through: :invitations, source: :user, dependent: :destroy

  scope :past, -> { where('date < ?', DateTime.now) }
  scope :upcoming, -> { where('date > ?', DateTime.now) }
end
