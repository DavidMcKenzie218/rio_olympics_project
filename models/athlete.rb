require_relative '../db/sql_runner.rb'
require 'pg'

class Athlete

  attr_reader :name, :id, :nation_id, :event_id, :event_time, :medal

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
    @nation_id = options['nation_id'].to_i
    @event_id = options['event_id'].to_i
    @event_time = options['event_time'].to_f
    @medal = options['medal']
  end

  def save()
    sql = "INSERT INTO athletes (name, nation_id, event_id, event_time) VALUES ('#{@name}', #{@nation_id}, #{@event_id}, #{event_time}) RETURNING *;"
    athlete = SqlRunner.run(sql).first
    @id = athlete['id']
  end

  def delete()
    sql = "DELETE * FROM athletes WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def event()
    sql = "SELECT * FROM events WHERE events.id = #{@event_id};"
    return Event.map_items(sql)
  end

  def nation()
    sql = "SELECT * FROM nations WHERE nations.id = #{@nation_id};"
    return Nation.map_items(sql)
  end

  def self.update(options)
      sql = "UPDATE athletes SET 
        name = '#{options['name']}',
        nation_id = '#{options['nation_id'].to_i}',
        event_id = '#{options['event_id'].to_i}',
        event_time = '#{options['event_time'].to_f}',
        medal = '#{options['medal']}'
        WHERE id=#{options['id'].to_i};"
        SqlRunner.run(sql)
  end  

  def self.delete_all
    sql = "DELETE FROM athletes;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM athletes;"
    return Athlete.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM athletes WHERE id = #{id.to_i};"
    return Athlete.map_items(sql)
  end 

  def self.map_items(sql)
    athletes = SqlRunner.run(sql)
    result = athletes.map { |athlete| Athlete.new( athlete ) }
    return result
  end

end