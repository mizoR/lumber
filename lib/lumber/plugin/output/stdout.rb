# -*- coding: utf-8 -*-

module Lumber
  module Plugin
    module Output
      class Stdout
        def initialize
        end

        def exec(data)
          data.each do |row|
            $stdout.puts row
          end
        end
      end
    end
  end
end

