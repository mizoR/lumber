# -*- coding: utf-8 -*-
require 'macaroni/core/pipeline'

module Macaroni
  module Core
    module DSL
      def self.included klass
        Kernel.send(:define_method, :pipeline) do |&block|
          pipeline = Pipeline.new
          pipeline.instance_eval(&block)
          pipeline.exec
        end
      end
    end
  end
end

