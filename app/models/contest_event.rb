class ContestEvent < ApplicationRecord
  validates :description, presence: true
  belongs_to :contest
end
