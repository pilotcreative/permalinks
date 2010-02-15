require "rubygems"
require "active_record"
require "shoulda"

require File.join(File.dirname(__FILE__), "..", "lib", "permalinks")

ActiveRecord::Base.establish_connection(:adapter  => "sqlite3", :database => ":memory:")
ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define(:version => 0) do
  create_table(:countries) { |t| t.string  :name, :default => "" }
  create_table(:posts) { |t| t.string  :title, :default => "" }
end

class Country < ActiveRecord::Base
  has_permalink
end

class Post < ActiveRecord::Base
  has_permalink :title
end
