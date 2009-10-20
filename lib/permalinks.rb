module Permalinks
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def has_permalink(field = :name)
      define_method(:to_param) do
        "#{id}-#{send(field).to_s.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/, '-').gsub(/(^-)|(-$)/ ,'')
      end
    end
  end
end

ActiveRecord::Base.send(:include, Permalinks)