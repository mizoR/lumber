# -*- coding: utf-8 -*-
require 'macaroni/core/dsl'
require 'macaroni/plugin/input/rss'
require 'macaroni/plugin/filter'
require 'macaroni/plugin/filter/deduped'
require 'macaroni/plugin/output/stdout'

include Macaroni::Plugin

pipe do
  plug Input::RSS, 'http://news.yahoo.com/rss/'
  plug Input::RSS, 'http://rss.dailynews.yahoo.co.jp/fc/rss.xml'
  plug Filter::Deduped
  plug Filter::Map do |row|
    {:title => row.title, :url => row.url}
  end
  plug Output::Stdout
end

