# -*- coding: utf-8 -*-

module Macaroni
  module Core
    class Pipe
      def initialize
        @plugs = []
      end

      def exec
        @plugs.inject([]) do |data, (executer, block)|
          executer.exec(data)
        end
      end

      private

      def plug(klass, *args, &block)
        @plugs << [klass.new(*args, &block)]
      end
    end
  end
end
