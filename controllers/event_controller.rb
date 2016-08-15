require_relative '../models/event.rb'

#NEW#

get('/events/new') do
  erb(:'event/new')
end

#CREATE

post('/events') do
  @event = Event.new(params)
  @event.save
  erb(:'event/create')
end

#SHOW

#INDEX

#EDIT

#UPDATE

#DESTROY