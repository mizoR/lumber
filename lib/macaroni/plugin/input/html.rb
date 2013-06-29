# -*- coding: utf-8 -*-
require 'feed-normalizer'
require 'nokogiri'

module Macaroni
  module Plugin
    module Input
      class HTML
        def initialize(url)
          @url = url
        end

        def exec(data)
          Nokogiri::HTML(open(@url))
        end
      end
    end
  end
end
