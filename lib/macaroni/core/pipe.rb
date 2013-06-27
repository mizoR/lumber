# -*- coding: utf-8 -*-

module Macaroni
  module Core
    class Pipe
      def initialize(options={})
        @default_data = options[:default_data] || []
        @plugins = []
      end

      def exec
        @plugins.inject(@default_data) do |data, (klass, args, block)|
          klass.new(*args, &block).exec(data)
        end
      end

      private

      def plug(klass, *args, &block)
        @plugins << [klass, args, block]
      end
    end
  end
end
