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

get('/events/:id') do
  @event = Event.find(params['id'].to_i).first
  # binding.pry
  erb(:'event/show')
end

#INDEX

get('/events') do
  @events = Event.all
  erb(:'event/index')
end

#EDIT

#UPDATE

#DESTROY