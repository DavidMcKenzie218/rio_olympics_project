require_relative '../db/sql_runner.rb'
require 'pg'

class Nation

  attr_reader :name, :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i    
  end

  def save()
    sql = "INSERT INTO nations (name) VALUES ('#{@name}') RETURNING *;"
    nation = SqlRunner.run(sql).first
    @id = nation['id']
  end

  def delete()
    sql = "DELETE * FROM nation WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def athlete
    sql = "SELECT * FROM athletes WHERE athletes.nation_id = #{@id};"
    return Athlete.map_items(sql)
  end

  def self.update(options)
    sql = "UPDATE nations SET 
      name = '#{opions['name']}
      WHERE id = #{options[id]};"
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
    return SqlRunner.run(sql)
  end 

  def self.map_items(sql)
    nations = SqlRunner.run(sql)
    result = nations.map { |nation| Nation.new( nation ) }
    return result
  end


end