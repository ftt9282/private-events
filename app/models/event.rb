class Event < ApplicationRecord
  belongs_to :event_creator, class_name: "User"
  has_many :attendees, through: :invites
  has_many :invites, foreign_key: "attended_event_id"

  scope :upcoming, -> { where("date > ?", Date.today) }
  scope :past, -> { where("date < ?", Date.today) }
end
