require 'pry-byebug'

require_relative '../models/nation.rb'
require_relative '../models/event.rb'
require_relative '../models/athlete.rb'

Nation.delete_all()
Event.delete_all()
Athlete.delete_all()

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

marcelo = Athlete.new({'name' => 'Marcelo', 'nation_id' => brazil.id, 'event_id' => running.id, 'event_time' => 1.10, 'medal' => 'none'})
vargas = Athlete.new({'name' => 'Vargas', 'nation_id' => peru.id, 'event_id' => dressage.id, 'event_time' => 2, 'medal' => 'none'})

marcelo.save()
vargas.save()

binding.pry

nil