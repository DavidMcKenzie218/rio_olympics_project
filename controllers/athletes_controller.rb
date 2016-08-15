require_relative '../models/athlete.rb'

#NEW

get('/athletes/new') do
  @nations = Nation.all()
  @events = Event.all
  erb(:'athlete/new')
end

#CREATE

post('/athletes') do
  @athlete = Athlete.new(params)
  # binding.pry
  @athlete.save
  erb(:'athlete/create')
end

#INDEX

get('/athletes') do  
  events = Event.all
  # binding.pry
  events.each {|event| 
    # binding.pry
    event.assign_medals}
  @athletes = Athlete.all()
  # binding.pry
  erb(:'athlete/index')
end

#SHOW

get('/athletes/:id') do
  @athlete = Athlete.find(params['id']).first
  erb(:'athlete/show')
end
