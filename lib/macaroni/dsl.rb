# -*- coding: utf-8 -*-

module Macaroni
  module DSL
    def pipe(name, options={}, &block)
      pipe = Macaroni::Core::Pipe.new options
      pipe.instance_eval(&block)
      Macaroni::application.set_pipe(name, pipe)
    end
  end
end

class << self
  include Macaroni::DSL
end

