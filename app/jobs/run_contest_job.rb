class RunContestJob < ApplicationJob
  queue_as :default

  def perform(contest)
    contest.commence
  end
end
