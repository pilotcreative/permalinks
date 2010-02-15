module Permalinks
  class Configuration
    include Singleton

    attr_accessor :substitutions
  end

  def self.configuration
    returning(Configuration.instance) { |c| yield(c) if block_given? }
  end
end
