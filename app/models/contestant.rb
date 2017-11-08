class Contestant < ApplicationRecord
store :contestant_attributes, accessors: [ :name, :strength, :integrity, :intelligence, :speed ]
  belongs_to :contest
  validates :contestant_attributes, presence: true
end
