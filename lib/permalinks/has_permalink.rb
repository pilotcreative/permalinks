module Permalinks
  module HasPermalink
    def has_permalink(field = :name)
      define_method(:to_param) do
        Permalinks.to_param(id, send(field))
      end
    end
  end
end
