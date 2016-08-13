require 'minitest/autorun'
require 'minitest/rg'

require_relative '../models/athlete.rb'

class TestAthlete < Minitest::Test

  def setup
    @new_brazil_athlete = Athlete.new({
      'name' => 'Marcelo',
      'id' => 1,
      'nation_id' => 1,
      'event_id' => 1})
    @new_peru_athlete = Athlete.new({
      'name' => 'Vargas',
      'id' => 2,
      'nation_id' => 2,
      'event_id' => 2})
  end

  def test_athlete_brazil_has_name
    assert_equal('Marcelo', @new_brazil_athlete.name)
  end

  def test_athlete_peru_has_name
    assert_equal('Vargas', @new_peru_athlete.name)
  end

  def test_athlete_brazil_has_id
    assert_equal(1, @new_brazil_athlete.id)
  end

  def test_athlete_peru_has_id
    assert_equal(2, @new_peru_athlete.id)
  end

  def test_athlete_brazil_has_nation_id
    assert_equal(1, @new_brazil_athlete.nation_id)
  end

  def test_athlete_peru_has_nation_id
    assert_equal(2, @new_peru_athlete.nation_id)
  end

  def test_athlete_brazil_has_event_id
    assert_equal(1, @new_brazil_athlete.event_id)
  end

  def test_athlete_peru_has_event_id
    assert_equal(2, @new_peru_athlete.event_id)
  end

end