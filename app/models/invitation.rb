class Invitation < ApplicationRecord
  enum status: {
    'pending' => 0,
    'approved' => 1,
    'declined' => 2
  }
  belongs_to :user
  belongs_to :event
end
