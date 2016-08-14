require 'minitest/autorun'
require 'minitest/rg'

require_relative '../models/league.rb'

class TestLeague < Minitest::Test

  def setup
    brazil = Nation.new({'name' => 'Brazil', 'id' => 1 , 'points' => 0})
    peru = Nation.new({'name' => 'Peru', 'id' => 2, 'points' => 0})
    france = Nation.new({'name' => 'France', 'id' => 3,'points' => 0})
    gb = Nation.new({'name' => 'Great Britain', 'id' => 4, 'points' => 0})

    running = Event.new({'name' => 'Running'})
    swimming = Event.new({'name' => 'Swimming'})
    dressage = Event.new({'name' => 'Dressage'})

    marcelo = Athlete.new({'name' => 'Marcelo', 'nation_id' => brazil.id, 'event_id' => running.id, 'event_time' => 1.10, 'medal' => 'gold'})
    paul = Athlete.new({'name' => 'Paul', 'nation_id' => france.id, 'event_id' => running.id, 'event_time' => 1.60, 'medal' => 'bronze'})
    jimmy = Athlete.new({'name' => 'Jimmy', 'nation_id' => gb.id, 'event_id' => running.id, 'event_time' => 1.30, 'medal' => 'silver'})
    vargas = Athlete.new({'name' => 'Vargas', 'nation_id' => peru.id, 'event_id' => dressage.id, 'event_time' => 2, 'medal' => 'gold'})

    nations = [brazil, peru, france, gb]
    events = [running, swimming, dressage]
    athletes = [marcelo, paul, jimmy, vargas]

    @league = League.new(nations, events, athletes)
  end

  def test_can_assign_medal_points_gold_brazil
    @league.assign_points
    assert_equal(5, @league.nation_points(1))
  end

  def test_can_assign_medal_points_silver
    @league.assign_points
    assert_equal(3, @league.nation_points(4))
  end

  def test_can_assign_medal_points_bronze
    @league.assign_points
    assert_equal(1, @league.nation_points(3))
  end

  def test_can_rank_nations_based_on_their_points
    assert_equal([{'name' => 'Brazil', 'points' => 5}, {'name' => 'Peru', 'points' => 5}, {'name' => 'Great Britain', 'points' => 3}, {'name' => 'France', 'points' => 1}], @league.rank_on_medal_points)
  end

  def test_count_gold_medals_for_nation_brazil
    assert_equal(1, @league.number_of_gold_medals(1))
  end

  def test_count_gold_medals_for_nation_gb
    assert_equal(0, @league.number_of_gold_medals(4))
  end

  def test_count_silver_medals_for_each_nation_gb
    assert_equal(1, @league.number_of_silver_medals(4))
  end

  def test_count_silver_medals_for_each_nation_brazil
    assert_equal(0, @league.number_of_silver_medals(1))
  end

  def test_count_bronze_medals_for_each_nation_france
    assert_equal(1, @league.number_of_bronze_medals(3))
  end


  def test_count_bronze_medals_for_each_nation_brazil
    assert_equal(0, @league.number_of_bronze_medals(1))
  end

end