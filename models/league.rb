require_relative './athlete.rb'
require_relative './event.rb'
require_relative './nation.rb'

class League 

  def initialize()
    @athletes = Athletes.all()
    @events = Events.all()
    @nations = Nations.all()
  end

end