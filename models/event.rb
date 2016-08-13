require_relative '../db/sql_runner.rb'
require 'pg'

class Event 

  attr_reader :name, :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
  end

end