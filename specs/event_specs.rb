require 'minitest/autorun'
require 'minitest/rg'

require_relative '../models/event.rb'

class TestEvent < MiniTest::Test

  def setup
    @new_running_event = Event.new({'name' => 'Running', 
      'id' => 1})
    @new_swimming_event = Event.new({'name' => 'Swimming',
      'id' => 2})
  end

  def test_event_running_has_name
    assert_equal('Running', @new_running_event.name)
  end

  def test_event_swimming_has_name
    assert_equal('Swimming', @new_swimming_event.name)
  end

  def test_event_running_has_id
    assert_equal(1, @new_running_event.id)
  end

  def test_event_swimming_has_id
    assert_equal(2, @new_swimming_event.id)
  end 

end