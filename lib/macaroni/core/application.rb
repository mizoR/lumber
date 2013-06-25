# -*- coding: utf-8 -*-
require 'singleton'

module Macaroni
  module Core
    class Application
      include Singleton

      def initialize
        @pipes = {}
      end

      def set_pipe(name, pipe)
        @pipes[name.to_sym] = pipe
      end

      def exec_pipe(name)
        @pipes[name.to_sym].exec
      end
    end
  end
end

