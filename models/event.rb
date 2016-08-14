require_relative '../db/sql_runner.rb'
require 'pg'

class Event 

  attr_reader :name, :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
    @athletes = []
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
    assign_silver_medal()
    assign_bronze_medal()
  end

  def assign_gold_medal
    gold = @athletes.first
    sql = "UPDATE athletes SET 
    medal = 'gold' WHERE athletes.id = #{gold.id};"
    SqlRunner.run(sql)
  end

  def assign_silver_medal
    silver = @athletes[1]
    sql = "UPDATE athletes SET 
    medal = 'silver' WHERE athletes.id = #{silver.id};"
    SqlRunner.run(sql)
  end

  def assign_bronze_medal
    bronze = @athletes[2]
    sql = "UPDATE athletes SET 
    medal = 'bronze' WHERE athletes.id = #{bronze.id};"
    SqlRunner.run(sql)
  end

  def results
    rankings = @athletes.map do |athlete|
      {
        'athlete' => athlete,
        'time' => athlete.event_time()
      }
    end
    places = rankings.sort{|athlete1, athlete2| athlete2['time'] <=> athlete1['time']}
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
    return SqlRunner.run(sql)
  end 

   def self.map_items(sql)
     events = SqlRunner.run(sql)
     result = events.map { |event| Event.new( event ) }
     return result
   end

end