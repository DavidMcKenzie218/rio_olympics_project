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
    sql = "INSERT INTO athletes (name, nation_id, event_id) VALUES ('#{@name}', #{@nation_id}, #{@event_id}) RETURNING *;"
    athlete = SqlRunner.run(sql).first
    @id = athlete['id']
  end

  def delete()
    sql = "DELETE * FROM athletes WHERE id = #{@id};"
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
    sql = "SELECT * FROM athletes WHERE id = #{id};"
    return SqlRunner.run(sql)
  end 

  def self.map_items(sql)
    athletes = SqlRunner.run(sql)
    result = athletes.map { |athlete| Athlete.new( athlete ) }
    return result
  end

end