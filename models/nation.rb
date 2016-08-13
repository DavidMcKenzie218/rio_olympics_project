require_relative '../db/sql_runner.rb'
require('pg')

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

  def self.delete_all()
    sql = "DELETE FROM nations"
    SqlRunner.run(sql)
  end

end