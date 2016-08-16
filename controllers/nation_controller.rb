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

#INDEX

#EDIT

#UPDATE

#DESTROY