# -*- coding: utf-8 -*-
require 'lumber'
require 'lumber/plugin/input/rss'
require 'lumber/plugin/filter/each'
require 'lumber/plugin/filter/map'

include Lumber::Plugin

self.pipeline do
  stage Input::RSS, 'https://github.com/mizoR.atom'
  stage Filter::Map do |row|
    {
      :url   => row.link.href,
      :title => row.title.content,
    }
  end
  stage Filter::Each do |row|
    p row
  end
end

