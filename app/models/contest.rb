class Contest < ApplicationRecord
  enum status: [:pending, :running, :finished]
  belongs_to :winner, class_name: 'Contestant', optional: true
  has_many :contestants
  has_many :events, class_name: 'ContestEvent'

  validates :contestant_one, presence: true, on: :create
  validates :contestant_two, presence: true, on: :create

  after_create :start_contest

  def contestant_one=(attributes = {})
    @contestant_one = contestants.build(contestant_attributes: attributes)
  end

  def contestant_one
    @contestant_one
  end

  def contestant_two=(attributes = {})
    @contestant_two = contestants.build(contestant_attributes: attributes)
  end

  def contestant_two
    @contestant_two
  end

  def self.contest_types
    [
      Contests::Jumping,
      Contests::Running
    ].map { |klass| klass.name.demodulize }
  end

  private

  def start_contest
    RunContestJob.set(wait: 5.seconds).perform_later(self)
  end
end
