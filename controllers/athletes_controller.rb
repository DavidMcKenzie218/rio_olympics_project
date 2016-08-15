require_relative '../models/athlete.rb'

#NEW

get('/athletes/new') do
  @nations = Nation.all()
  @events = Event.all
  erb(:'athlete/new')
end