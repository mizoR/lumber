# -*- coding: utf-8-*-

pipe :default do
  plug Input::RSS, 'http://news.yahoo.com/rss/'
  plug Input::RSS, 'http://rss.dailynews.yahoo.co.jp/fc/rss.xml'
  plug Filter::Map do |row|
    {:title => row.title, :url => row.url}
  end
  plug Output::Stdout
end

pipe :reverse_sample do
  plug Input::RSS, 'http://news.yahoo.com/rss/'
  plug Input::RSS, 'http://rss.dailynews.yahoo.co.jp/fc/rss.xml'
  plug Filter::Reverse
  plug Filter::Map do |row|
    {:title => row.title, :url => row.url}
  end
  plug Output::Stdout
end

pipe :deduped_sample do
  plug Input::RSS, 'http://news.yahoo.com/rss/'
  plug Input::RSS, 'http://rss.dailynews.yahoo.co.jp/fc/rss.xml'
  plug Filter::Deduped
  plug Filter::Map do |row|
    {:title => row.title, :url => row.url}
  end
  plug Output::Stdout
end

pipe :each_with_index_sample do
  plug Input::RSS, 'http://news.yahoo.com/rss/'
  plug Input::RSS, 'http://rss.dailynews.yahoo.co.jp/fc/rss.xml'
  plug Filter::Map do |row|
    {:title => row.title, :url => row.url}
  end
  plug Filter::EachWithIndex do |row, i|
    row.merge!(id: i)
  end
  plug Output::Stdout
end

