class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_and_belongs_to_many :attendees, class_name: 'User'

  scope :past, -> { where('date < ?', DateTime.now) }
  scope :upcoming, -> { where('date > ?', DateTime.now) }

  # def past
  #  date < DateTime.now
  # end

  # def upcoming
  #  date > DateTime.now
  # end
end
