# -*- coding: utf-8 -*-

module Lumber
  module Plugin
    module Filter
      class Base
        def initialize(*args, &block)
          @args  = args
          @block = block
        end

        def exec(data)
          data
        end
      end
    end
  end
end

