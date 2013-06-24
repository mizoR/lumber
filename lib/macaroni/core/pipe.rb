# -*- coding: utf-8 -*-

module Macaroni
  module Core
    class Pipe
      def initialize
        @plugins = []
      end

      def exec
        @plugins.inject([]) do |data, plugin|
          plugin.exec(data)
        end
      end

      private

      def plug(klass, *args, &block)
        @plugins << klass.new(*args, &block)
      end
    end
  end
end
