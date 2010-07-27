module Permalinks
  class Configuration
    include Singleton

    attr_writer :substitutions, :input_encoding

    def substitutions
      @substitutions ||= {}
    end

    def input_encoding
      @input_encoding ||= "UTF-8"
    end
  end

  def self.configuration
    Configuration.instance.tap { |c| yield(c) if block_given? }
  end
end
