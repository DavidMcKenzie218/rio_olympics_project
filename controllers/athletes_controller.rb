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
  events.each do |event| 
    if event.athletes.count > 2
      event.assign_medals_athletes
    end
  end
  erb(:'athlete/create')
end

#INDEX

get('/athletes') do  
  events = Event.all
  # binding.pry
  events.each do |event| 
    if event.athletes.count > 2
      event.assign_medals_athletes
  end
end
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
  events.each do |event| 
    if event.athletes.count > 2
      event.assign_medals_athletes
    end
  end
  redirect(to('/athletes'))
end

#DESTROY

post('/athletes/:id/delete') do
  Athlete.delete(params['id'])
  redirect(to('/athletes'))
end