require_relative './athlete.rb'
require_relative './event.rb'
require_relative './nation.rb'

class League 

  def initialize()
    @athletes = Athlete.all()
    @events = Event.all()
    @nations = Nation.all()
  end

  #Rank athletes based on their score in each event
  #Rank nations based on athletes scores
  #Give the nations the total medals, gold, silver, bronze


end