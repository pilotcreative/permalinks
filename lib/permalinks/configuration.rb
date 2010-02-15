module Permalinks
  class Configuration
    include Singleton

    attr_accessor :custom_replace_table

    def self.configuration
      returning(Configuration.instance) { |c| yield c if block_given? }
    end
  end
end
