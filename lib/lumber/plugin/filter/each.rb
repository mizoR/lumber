# -*- coding: utf-8 -*-
require 'lumber/plugin/filter/base'

module Lumber
  module Plugin
    module Filter
      class Each < Base
        def exec(data)
          data.each(*@args, &@block)
        end
      end
    end
  end
end

