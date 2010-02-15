# Include hook code here
require File.dirname(__FILE__) + '/lib/permalinks'

ActiveRecord::Base.extend(Permalinks::HasPermalink)
