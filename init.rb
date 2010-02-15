require File.join(File.dirname(__FILE__), "lib", "permalinks")

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend(Permalinks::HasPermalink)
end
