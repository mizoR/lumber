# -*- coding: utf-8 -*-
require 'macaroni/core/pipe'

module Macaroni
  module Core
    module DSL
      def self.included klass
        Kernel.send(:define_method, :pipe) do |&block|
          pipe = Pipe.new
          pipe.instance_eval(&block)
          pipe.exec
        end
      end
    end
  end
end

