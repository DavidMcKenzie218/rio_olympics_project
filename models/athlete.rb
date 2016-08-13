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

end