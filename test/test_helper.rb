require 'rubygems'
require 'activerecord'
require File.dirname(__FILE__)+'/../lib/permalinks'
require 'expectations'
require 'logger'

ActiveRecord::Base.configurations = {'sqlite3' => {:adapter => 'sqlite3', :database => ':memory:'}}
ActiveRecord::Base.establish_connection('sqlite3')

ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.logger.level = Logger::WARN

ActiveRecord::Schema.define(:version => 0) do
  create_table :countries do |t|
    t.string  :name, :default => ''
  end

  create_table :posts do |t|
    t.string  :title, :default => ''
  end
end

class Country < ActiveRecord::Base
  has_permalink
end

class Post < ActiveRecord::Base
  has_permalink :title
end
