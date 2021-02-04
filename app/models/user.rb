class User < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  has_many :events, foreign_key: :creator_id
  has_and_belongs_to_many :attended_events, class_name: 'Event'
end
