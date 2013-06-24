# -*- coding: utf-8 -*-
require 'macaroni/plugin/filter/base'

module Macaroni
  module Plugin
    module Filter
      def self.const_missing(name)
        method_name = name.to_s.
                      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
                      gsub(/([a-z\d])([A-Z])/,'\1_\2').tr("-", "_").
                      downcase
        klass = Class.new(Base) do
          define_method :exec do |data|
            data.send(method_name, *@args, &@block)
          end
        end
        const_set(name, klass)
      end
    end
  end
end

