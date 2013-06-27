# -*- coding: utf-8 -*-
require 'macaroni/core/pipe'

module Macaroni
  module Core
    module DSL
      def pipe(name, &block)
        pipe = Macaroni::Core::Pipe.new
        pipe.instance_eval(&block)
        Macaroni::application.set_pipe(name, pipe)
      end
    end
  end
end

class << self
  include Macaroni::Core::DSL
end

