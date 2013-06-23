# -*- coding: utf-8 -*-
require 'lumber/plugin/filter/base'

module Lumber
  module Plugin
    module Filter
      class Select < Base
        def exec(data)
          data.select do |row|
            block.call(row)
          end
        end
      end
    end
  end
end

