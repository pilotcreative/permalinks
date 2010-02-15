require "test_helper"

class Country
  extend Permalinks::HasPermalink
  attr_accessor :name, :id
  has_permalink
end

class CountryTest < Test::Unit::TestCase
  def setup
    @country = Country.new
    @country.name = "United Kingdom"
    @country.id = 1
  end

  test "country with regular name" do
    assert_equal "#{@country.id}-united-kingdom", @country.to_param
  end

  test "country name with a lot of white spaces" do
    @country.name = "United    Kingdom   "
    assert_equal "#{@country.id}-united-kingdom", @country.to_param
  end

  test "country with id equal nil" do
    @country.name = "2-tratata"
    @country.id = nil
    assert_equal "#{@country.id}-2-tratata", @country.to_param
  end

  test "country name with capital letters" do
    @country.name = " USA "
    assert_equal "#{@country.id}-usa", @country.to_param
  end
end
