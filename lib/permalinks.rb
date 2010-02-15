require "singleton"
require "active_record"

module Permalinks
  def has_permalink(field = :name)
    define_method(:to_param) do
      "#{id}-#{send(field).to_s.strip.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/, '-')
    end
  end
end

ActiveRecord::Base.extend(Permalinks)
