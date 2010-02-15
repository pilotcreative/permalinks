# Include hook code here
require File.dirname(__FILE__) + '/lib/permalinks'

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend(Permalinks::HasPermalink)
end
