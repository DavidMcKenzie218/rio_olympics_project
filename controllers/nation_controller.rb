require_relative '../models/nation.rb'

#NEW

get('/nations/new') do
  erb(:'nation/new')
end

#CREATE

post('/nations') do
  @nation = Nation.new(params)
  @nation.save
  erb(:'nation/create')
end

#SHOW

get('/nations/:id') do 
  @nation = Nation.find(params['id'].to_i).first
  erb(:'nation/show')
end

#INDEX

get('/nations') do
  @nations = Nation.all()
  @athletes = Athlete.all()
  @events = Event.all()
  @olympics = League.new(@nations, @events, @athletes)
  @olympics.reset_points
  @olympics.rank_on_medal_points
  erb(:'nation/index')
end

#EDIT

get('/nations/:id/edit') do
  @nation = Nation.find(params['id'].to_i).first
  erb(:'nation/edit')
end

#UPDATE

post('/nations/:id') do
  Nation.update(params)
  redirect(to('/nations'))
end

#DESTROY

post('/nations/:id/delete') do
  Nation.delete(params['id'])
  redirect(to('/nations'))
end