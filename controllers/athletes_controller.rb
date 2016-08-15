require_relative '../models/athlete.rb'

#NEW

get('/athletes/new') do
  @nations = Nation.all()
  @events = Event.all()
  erb(:'athlete/new')
end

#CREATE

post('/athletes') do
  @athlete = Athlete.new(params)
  # binding.pry
  @athlete.save
  events = Event.all
  events.each {|event| 
    event.assign_medals}
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
  # binding.pry
  @athlete = Athlete.find(params['id'].to_i).first
  erb(:'athlete/show')
end

#EDIT

get('/athletes/:id/edit') do
  @nations = Nation.all()
  @events = Event.all()
  @athlete = Athlete.find(params['id']).first
  erb(:'athlete/edit')
end 

#UPDATE

post('/athletes/:id') do
  # binding.pry
  Athlete.update(params)
  # binding.pry
  events = Event.all
  events.each {|event| 
    event.assign_medals}
  redirect(to('/athletes'))
end

#DESTROY

post('/athletes/:id/delete') do
  Athlete.delete(params['id'])
  redirect(to('/athletes'))
end