require 'minitest/autorun'
require 'minitest/rg'

require_relative '../models/league.rb'

class TestLeague < Minitest::Test

  def setup
    brazil = Nation.new({'name' => 'Brazil'})
    peru = Nation.new({'name' => 'Peru'})
    france = Nation.new({'name' => 'France'})
    gb = Nation.new({'name' => 'Great Britain'})

    running = Event.new({'name' => 'Running'})
    swimming = Event.new({'name' => 'Swimming'})
    dressage = Event.new({'name' => 'Dressage'})

    marcelo = Athlete.new({'name' => 'Marcelo', 'nation_id' => brazil.id, 'event_id' => running.id})
    vargas = Athlete.new({'name' => 'Vargas', 'nation_id' => peru.id, 'event_id' => dressage.id})

    nations = [brazil, peru, france, gb]
    events = [running, swimming, dressage]
    athletes = [marcelo, vargas]

    @league = League.new(nations, events, athletes)
  end

  

end