require_relative './athlete.rb'
require_relative './event.rb'
require_relative './nation.rb'

require 'pry-byebug'

class League 

  def initialize(nations, events, athletes)
    @athletes = athletes
    @events = events
    @nations = nations
    # binding.pry
  end

  #Rank athletes based on their score in each event
  #Rank nations based on athletes scores
  #Give the nations the total medals, gold, silver, bronze

  def assign_points
    results = @athletes.each do |athlete|
   
      nation = @nations.find{ |nation| nation.id ==athlete.nation_id}
      # binding.pry

      if athlete.medal == 'gold'        
        nation.points += 5
      elsif athlete.medal == 'silver'
        nation.points += 3
      elsif athlete.medal == 'bronze'
        nation.points += 1
      else
        nation.points += 0
      end

    end
  end

  def nation_points(nation_id)
    nation = @nations.find {|nation| nation.id == nation_id}
    return nation.points
  end

  def rank_on_medal_points
    assign_points()
    rankings = @nations.map do |nation|
      {'name' => nation.name,
        'points' => nation_points(nation.id)
      }
    end
    places = rankings.sort{|nation1, nation2| nation2['points'] <=> nation1['points']}
    return places
  end

  def number_of_gold_medals(nation_id)
    gold_count = 0
    nation = @nations.find {|nation| nation.id == nation_id}
    @athletes.each do |athlete|
      if athlete.nation_id == nation_id
        if athlete.medal == 'gold'
          gold_count +=1
        end
      end
    end 
    return gold_count
  end

end