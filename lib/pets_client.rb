require 'httparty'
require 'active_model'
class PetsClient
  include HTTParty

  base_uri 'wunder-pet-api-staging.herokuapp.com'

  def initialize
    @auth = {
      headers: { 'X-Pets-Token': 'UXhygiNEP1vYvRuPA4EluyJxLnscJ6uerTsUlnObFUqKxoyCnN' }
    }
  end

  def pets
    response = self.class.get('/pets', @auth)
    response.map { |pet_hash| Pet.new(pet_hash) }
  end

  def pet(id)
    response = self.class.get("/pets/#{id}", @auth)
    Pet.new(response.to_h)
  end

  def create_pet(pet)
    response = self.class.post('/pets', @auth.merge({body: options}))
  end

  class Pet
    include ActiveModel::Model
    attr_accessor :id, :name, :strength, :intelligence, :speed, :integrity

    def attributes
      { id: @id, name: @name, strength: @strength, intelligence: @intelligence, speed: @speed, integrity: @integrity }
    end
  end

end
