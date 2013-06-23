# -*- coding: utf-8 -*-
require 'rss'

module Lumber
  module Plugin
    module Input
      class RSS
        def initialize(url)
          @rss = ::RSS::Parser.parse(url)
        end

        def exec(data)
          data + @rss.items
        end
      end
    end
  end
end
