require 'pry-byebug'

require_relative '../models/nation.rb'
require_relative '../models/event.rb'
require_relative '../models/athlete.rb'

Nation.delete_all()
Event.delete_all()
Athlete.delete_all()

brazil = Nation.new({'name' => 'Brazil', 'points' => 0})
peru = Nation.new({'name' => 'Peru', 'points' => 0})
france = Nation.new({'name' => 'France', 'points' => 0})
gb = Nation.new({'name' => 'Great Britain', 'points' => 0})

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
paul = Athlete.new({'name' => 'Paul', 'nation_id' => france.id, 'event_id' => running.id, 'event_time' => 1.60, 'medal' => 'none'})
jimmy = Athlete.new({'name' => 'Jimmy', 'nation_id' => gb.id, 'event_id' => running.id, 'event_time' => 1.30, 'medal' => 'none'})
vargas = Athlete.new({'name' => 'Vargas', 'nation_id' => peru.id, 'event_id' => dressage.id, 'event_time' => 2, 'medal' => 'none'})

marcelo.save()
paul.save()
jimmy.save()
vargas.save()

binding.pry

nil