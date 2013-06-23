# -*- coding: utf-8 -*-
require 'lumber/plugin/filter/base'

module Lumber
  module Plugin
    module Filter
      class Map < Base
        def exec(data)
          data.map(*@args, &@block)
        end
      end
    end
  end
end

