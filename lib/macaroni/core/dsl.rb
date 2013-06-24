# -*- coding: utf-8 -*-
require 'macaroni/core/pipe'

def self.pipe(&block)
  pipe = Macaroni::Core::Pipe.new
  pipe.instance_eval(&block)
  pipe.exec
end

