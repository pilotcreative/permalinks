require "iconv"
require "singleton"

require "permalinks/configuration"
require "permalinks/has_permalink"

module Permalinks
  class << self
    def to_param(*args)
      args.join("-").tap do |result|
        replace_using_table!(result, configuration.substitutions)
        transliterate!(result, configuration.input_encoding)
        result.downcase!
        replace_non_alnum!(result)
        remove_double_dashes!(result)
        remove_trailing_dashes!(result)
      end
    end

    private

    def replace_using_table!(str, table)
      table.each { |from, to| str.gsub!(from, to) }
    end

    def transliterate!(str, encoding)
      result = Iconv.iconv("ASCII//TRANSLIT//IGNORE", encoding.to_s, str).first
      str.replace(result)
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
