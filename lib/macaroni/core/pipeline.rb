# -*- coding: utf-8 -*-

module Macaroni
  module Core
    class Pipeline
      def initialize
        @stages = []
      end

      def exec
        @stages.inject([]) do |data, (executer, block)|
          executer.exec(data)
        end
      end

      private

      def stage(klass, *args, &block)
        @stages << [klass.new(*args, &block)]
      end
    end
  end
end
