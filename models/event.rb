require_relative '../db/sql_runner.rb'
require 'pg'

class Event 

  attr_reader :name, :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
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