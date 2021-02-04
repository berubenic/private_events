class Event < ApplicationRecord
  validates :name, :body, :location, :date, presence: true
  validates :name, :location, length: { maximum: 25 }
  validates :body, length: { minimum: 10 }

  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :invitations
  has_many :attendees, class_name: 'User', through: :invitations, source: :user

  scope :past, -> { where('date < ?', DateTime.now) }
  scope :upcoming, -> { where('date > ?', DateTime.now) }
end
