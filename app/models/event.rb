class Event < ApplicationRecord
  validates :name, :body, :location, :date, presence: true
  validates :name, :location, length: { maximum: 25 }
  validates :body, length: { minimum: 10 }

  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_and_belongs_to_many :attendees, class_name: 'User'

  scope :past, -> { where('date < ?', DateTime.now) }
  scope :upcoming, -> { where('date > ?', DateTime.now) }
end
