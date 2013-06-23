# -*- coding: utf-8 -*-
require 'lumber/plugin/filter/base'

module Lumber
  module Plugin
    module Filter
      class Map < Base
        def exec(data)
          data.map do |row|
            @block.call(row)
          end
        end
      end
    end
  end
end

