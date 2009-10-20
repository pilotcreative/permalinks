require File.dirname(__FILE__) + '/test_helper'

Expectations do
  expect "1-something-cool" do
    p = Post.new :title => "Something cool"
    p.id = 1
    p.save!
    p.to_param
  end

  expect "5-united-kingdom" do
    c = Country.new :name => "United Kingdom"
    c.id = 5
    c.save!
    c.to_param
  end

  expect "6666-united-kingdom" do
    c = Country.new :name => "United    Kingdom   "
    c.id = 6666
    c.save!
    c.to_param
  end

  expect "11111-united-kingdom-is-cold" do
    p = Post.new :title => "   United    Kingdom is cold   "
    p.id = 11111
    p.save!
    p.to_param
  end

  #added - capital letters
  expect "6-usa" do
    c = Country.new :name => "USA"
    c.id = 6
    c.save!
    c.to_param
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
