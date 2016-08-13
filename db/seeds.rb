require 'pry-byebug'

require_relative '../models/nation.rb'
require_relative '../models/event.rb'
require_relative '../models/athlete.rb'

Nation.delete_all

brazil = Nation.new({'name' => 'Brazil'})
peru = Nation.new({'name' => 'Peru'})
france = Nation.new({'name' => 'France'})
gb = Nation.new({'name' => 'Great Britain'})

brazil.save()
peru.save()
france.save()
gb.save()

binding.pry

nil