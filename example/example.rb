# -*- coding: utf-8 -*-
require 'lumber'
require 'lumber/plugin/input/rss'
require 'lumber/plugin/filter'
require 'lumber/plugin/filter/deduped'

include Lumber::Plugin

pipeline do
  stage Input::RSS, 'http://news.yahoo.com/rss/'
  stage Input::RSS, 'http://rss.dailynews.yahoo.co.jp/fc/rss.xml'
  stage Filter::Deduped
  stage Filter::Map do |row|
    {:title => row.title, :url => row.url}
  end
  stage Filter::Each do |row|
    p row
  end
end

