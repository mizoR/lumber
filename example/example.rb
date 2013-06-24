# -*- coding: utf-8 -*-
require 'macaroni'
require 'macaroni/plugin/input/rss'
require 'macaroni/plugin/filter'
require 'macaroni/plugin/filter/deduped'
require 'macaroni/plugin/output/stdout'

include Macaroni::Plugin

pipeline do
  stage Input::RSS, 'http://news.yahoo.com/rss/'
  stage Input::RSS, 'http://rss.dailynews.yahoo.co.jp/fc/rss.xml'
  stage Filter::Deduped
  stage Filter::Map do |row|
    {:title => row.title, :url => row.url}
  end
  stage Output::Stdout
end

