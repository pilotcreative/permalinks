# -*- coding: utf-8 -*-

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

  if RUBY_VERSION >= "1.9" # FIXME: iconv doesn't work properly on 1.8.x
    test "country name in polish" do
      @country.name = "Wybrzeże Kości Słoniowej"
      assert_equal "#{@country.id}-wybrzeze-kosci-sloniowej", @country.to_param
    end

    test "country name in german without custom substitutions" do
      Permalinks.configuration { |config| config.substitutions = {} }
      @country.name = "Türkei"
      assert_equal "#{@country.id}-turkei", @country.to_param
    end
  end

  test "country name in german with custom substitutions" do
    Permalinks.configuration do |config|
      config.substitutions = {
        "ä" => "ae",
        "Ä" => "AE",
        "ö" => "oe",
        "Ö" => "OE",
        "ü" => "ue",
        "Ü" => "UE"
      }
    end

    @country.name = "Türkei"
    assert_equal "#{@country.id}-tuerkei", @country.to_param
  end
end
