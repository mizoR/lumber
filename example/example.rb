# -*- coding: utf-8 -*-
require 'lumber'
require 'lumber/plugin/input/rss'
require 'lumber/plugin/filter/each'
require 'lumber/plugin/filter/map'

include Lumber::Plugin

pipeline do
  stage Input::RSS, 'http://news.yahoo.com/rss/'
  stage Input::RSS, 'http://rss.dailynews.yahoo.co.jp/fc/rss.xml'
  stage Filter::Map do |row|
    {:title => row.title, :url => row.url}
  end
  stage Filter::Each do |row|
    p row
  end
end

