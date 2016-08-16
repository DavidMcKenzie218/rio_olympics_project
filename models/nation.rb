require_relative '../db/sql_runner.rb'
require 'pg'

class Nation

  attr_reader :name, :id
  attr_accessor :points

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
    @points = options['points'].to_i    
  end

  def save()
    sql = "INSERT INTO nations (name, points) VALUES ('#{@name}', #{@points}) RETURNING *;"
    nation = SqlRunner.run(sql).first
    @id = nation['id']
  end

  def self.delete(id)
    sql = "DELETE FROM nations WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def athlete
    sql = "SELECT * FROM athletes WHERE athletes.nation_id = #{@id};"
    return Athlete.map_items(sql)
  end

  def self.update(options)
    # binding.pry
    sql = "UPDATE nations SET 
      name = '#{options['name']}',
      points = #{options['points'].to_i}
      WHERE id = #{options['id'].to_i};"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM nations;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM nations;"
    return Nation.map_items(sql)
  end

  
  def self.find(id)
    sql = "SELECT * FROM nations WHERE id = #{id}"
    return Nation.map_items(sql)
  end 

  def self.map_items(sql)
    nations = SqlRunner.run(sql)
    result = nations.map { |nation| Nation.new( nation ) }
    return result
  end


end