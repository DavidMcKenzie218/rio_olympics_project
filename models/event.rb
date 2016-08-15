require_relative '../db/sql_runner.rb'
require 'pg'

class Event 

  attr_reader :name, :id, :gold_medalist, :silver_medalist, :bronze_medalist 

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
    @athletes = []
    @gold_medalist = nil
    @silver_medalist = nil
    @bronze_medalsit = nil
  end

  def save()
    sql = "INSERT INTO events (name) VALUES ('#{@name}') RETURNING *;"
    event = SqlRunner.run(sql).first
    @id = event['id']
  end

  def delete()
    sql = "DELETE * FROM events WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def athletes()
    sql = "SELECT * FROM athletes WHERE athletes.event_id = #{@id}"
   @athletes = Athlete.map_items(sql)
   return @athletes
  end

  def assign_medals
    athletes()
    results()
    assign_gold_medal()
    @gold_medalist = @athletes.first
    assign_silver_medal()
    @silver_medalist = @athletes[1]
    assign_bronze_medal()
    @bronze_medalist = @athletes[2]
    assign_no_medal()
  end

  def assign_gold_medal
    gold = @athletes.first
    athlete = gold['athlete']
    sql = "UPDATE athletes SET medal='gold' WHERE id=#{athlete.id};"
    SqlRunner.run(sql)
  end

  def assign_silver_medal
    silver = @athletes[1]
    athlete = silver['athlete']
    sql = "UPDATE athletes SET 
    medal = 'silver' WHERE id = #{athlete.id};"
    SqlRunner.run(sql)
  end

  def assign_bronze_medal
    bronze = @athletes[2]
    athlete = bronze['athlete']
    sql = "UPDATE athletes SET 
    medal = 'bronze' WHERE athletes.id = #{athlete.id};"
    SqlRunner.run(sql)
  end

  def assign_no_medal
    # binding.pry
    no_medals = @athletes[3..(@athletes.length)]
    no_medals.each do |no_medal|
      # binding.pry
      sql = "UPDATE athletes SET 
      medal = ' ' WHERE athletes.id = #{no_medal['athlete'].id};"
      SqlRunner.run(sql)
    end
  end

  def results
    @athletes.map! do |athlete|
      {
        'athlete' => athlete,
        'time' => athlete.event_time()
      }
      # binding.pry
    end
    places = @athletes.sort!{|athlete1, athlete2| athlete1['time'] <=> athlete2['time']}
    return places
  end

  def self.update(options)
    sql = "UPDATE events SET 
      name = '#{options['name']}'
      WHEREid = #{options['id']}"
      SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM events;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM events;"
    return Event.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM events WHERE id = #{id}"
    return Event.map_items(sql)
  end 

   def self.map_items(sql)
     events = SqlRunner.run(sql)
     result = events.map { |event| Event.new( event ) }
     return result
   end

end