require "singleton"

require "active_support/core_ext/object/misc"

require "permalinks/configuration"
require "permalinks/has_permalink"

module Permalinks
  class << self
    def to_param(*args)
      returning(args * "-") do |result|
        table = configuration.substitutions
        replace_with_table!(result, table) if table
        result.downcase!
        replace_non_alnum!(result)
        remove_double_dashes!(result)
        remove_trailing_dashes!(result)
      end
    end

    private

    def replace_with_table!(str, table)
      replace_table.each { |from, to| str.gsub!(from, to) }
    end

    def replace_non_alnum!(str)
      str.gsub!(/[^a-z0-9]/, "-")
    end

    def remove_double_dashes!(str)
      str.gsub!(/-+/, "-")
    end

    def remove_trailing_dashes!(str)
      str.gsub!(/-+\Z/, "")
    end
  end
end
