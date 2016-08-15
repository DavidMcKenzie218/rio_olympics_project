require_relative '../models/event.rb'
require( 'pry-byebug' )

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

get('/events') do
  @events = Event.all
  erb(:'event/index')
end

#EDIT

#UPDATE

#DESTROY