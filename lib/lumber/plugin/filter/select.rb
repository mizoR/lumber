# -*- coding: utf-8 -*-
require 'lumber/plugin/filter/base'

module Lumber
  module Plugin
    module Filter
      class Select < Base
        def exec(data)
          data.select(*@args, &@block)
        end
      end
    end
  end
end

