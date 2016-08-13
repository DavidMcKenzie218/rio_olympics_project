require 'minitest/autorun'
require 'minitest/rg'

require_relative '../models/nation.rb'

class TestNation < MiniTest::Test

  def setup
    @nation_brazil = Nation.new({
          'name' => 'Brazil',
          'id' => 1
        })
    @nation_peru = Nation.new({
        'name' => 'Peru',
        'id' => 2
      })
  end

  def test_nation_brazil_has_name
    assert_equal('Brazil', @nation_brazil.name)
  end

  def test_nation_peru_has_name
    assert_equal('Peru', @nation_peru.name)
  end

  def test_nation_brazil_has_id
    assert_equal(1, @nation_brazil.id)
  end

  def test_nation_peru_has_id
    assert_equal(2, @nation_peru.id)
  end

end