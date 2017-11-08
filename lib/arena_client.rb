require 'httparty'
require 'active_model'
class ArenaClient
  include HTTParty
  base_uri 'localhost:3000'

  def contests
    self.class.get('/contests')
  end

  def contest_types
    response = self.class.get('/contest_types')
    response.parsed_response
  end

  def start_contest(type, contestant_one = {}, contestant_two = {})
    res = self.class.post("/contests/#{type}", body: {
      contest: {
        contestant_one: contestant_one,
        contestant_two: contestant_two
      }
    })
    res.parsed_response
  end

  def contest(id)
    res = self.class.get("/contests/#{id}")
    res.parsed_response
  end

  def contest_events(id, last_id = nil)
    res = self.class.get("/contests/#{id}/events", query: { last_id: last_id })
    res.parsed_response
  end

  class Contest
    include ActiveModel::Model
  end
end
