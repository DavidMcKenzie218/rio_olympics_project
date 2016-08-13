require_relative '../db/sql_runner.rb'
require 'pg'

class Athlete

  attr_reader :name, :id, :nation_id, :event_id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
    @nation_id = options['nation_id'].to_i
    @event_id = options['event_id'].to_i
  end

  def save()
    sql = "INSERT INTO athletes (name) VALUES ('#{@name}') RETURNING *;"
    event = SqlRunner.run(sql).first
    @id = event['id']
  end

  def self.delete_all
    sql = "DELETE FROM athletes;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM athletes;"
    return Event.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM athletes WHERE id = #{id}"
    return SqlRunner.run(sql)
  end 

  def self.map_items(sql)
    athletes = SqlRunner.run(sql)
    result = athletes.map { |athlete| Event.new( athlete ) }
    return result
  end

end