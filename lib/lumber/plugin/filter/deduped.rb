# -*- coding: utf-8 -*-
require 'lumber/plugin/filter/select'

module Lumber
  module Plugin
    module Filter
      class Each < Select
        def exec(data, &block)
          data.each do |row|
            block.call(row)
          end
        end
      end
    end
  end
end

