# -*- coding: utf-8 -*-

module Macaroni
  module Plugin
    module Output
      class Stdout
        def initialize
        end

        def exec(data)
          $stdout.puts data
          data
        end
      end
    end
  end
end

