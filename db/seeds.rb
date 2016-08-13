require 'pry-byebug'

require_relative '../models/nation.rb'
require_relative '../models/event.rb'
require_relative '../models/athlete.rb'

Nation.delete_all()
Event.delete_all()

brazil = Nation.new({'name' => 'Brazil'})
peru = Nation.new({'name' => 'Peru'})
france = Nation.new({'name' => 'France'})
gb = Nation.new({'name' => 'Great Britain'})

brazil.save()
peru.save()
france.save()
gb.save()

running = Event.new({'name' => 'Running'})
swimming = Event.new({'name' => 'Swimming'})
dressage = Event.new({'name' => 'Dressage'})

running.save()
swimming.save()
dressage.save()

marcelo = Athlete.new({'name' => 'Marcelo', 'nation_id' => brazil.id, 'event.id' => running.id})
vargas = Athlete.new({'name' => 'Vargas', 'nation_id' => peru.id, 'event_id' => dressage.id})

marcelo.save()
vargas.save()

binding.pry

nil