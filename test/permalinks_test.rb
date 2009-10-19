require File.dirname(__FILE__) + '/test_helper'

Expectations do
  expect "1-something-cool" do
    p = Post.new :title => "Something cool"
    p.id = 1
    p.save!
    p.to_param
  end

  expect "5-united-kingdom" do
    p = Country.new :name => "United Kingdom"
    p.id = 5
    p.save!
    p.to_param
  end

  #error !!!!!!!!!!!
  #TODO: fix it!!!!
  expect "6666-united-kingdom" do
    p = Country.new :name => "United    Kingdom   "
    p.id = 6666
    p.save!
    p.to_param
  end

  #added - capital letters
  expect "6-usa" do
    p = Country.new :name => "USA"
    p.id = 6
    p.save!
    p.to_param
  end

  # added - should clean up strings with arbitrary spaces
  expect "7-spaces-should-not-matter" do
    p = Post.new
    p.id = 7;
    p.title = "Spaces Should    Not MATTER"
    p.save!
    p.to_param
  end
end
