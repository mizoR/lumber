# -*- coding: utf-8 -*-
require 'lumber/plugin/filter/base'

module Lumber
  module Plugin
    module Filter
      class Each < Base
        def exec(data)
          data.each do |row|
            @block.call(row)
          end
        end
      end
    end
  end
end

