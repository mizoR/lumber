# -*- coding: utf-8-*-

include Macaroni::Plugin

pipe :news do
  plug Input::RSS, 'http://news.yahoo.com/rss/'
  plug Input::RSS, 'https://news.google.com/news/feeds?cf=all&ned=us&hl=en&output=rss'
  plug Filter::Sort do |a, b|
    b.date_published <=> a.date_published
  end
  plug Filter::Slice, 1, 5
  plug Filter::Map do |row|
    {:title => row.title, :url => row.url}
  end
  plug Output::Stdout
end

pipe :ruby_news do
  plug Input::HTML, 'http://www.ruby-lang.org/en/'
  plug Filter::Css, '#content div.post h3'
  plug Output::Stdout
end

pipe :string_processing_sample, :data => 'Hello World!' do
  plug Filter::Downcase
  plug Output::Stdout
  plug Filter::Reverse
  plug Output::Stdout
  plug Filter::Upcase
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

pipe :im_kayac_sample do
  plug Input::RSS, 'http://news.yahoo.com/rss/'
  plug Input::RSS, 'http://rss.dailynews.yahoo.co.jp/fc/rss.xml'
  plug Filter::Map do |row|
    {:message => row.title, :handler => row.url}
  end
  plug Output::ImKayac, :username => ENV['IM_KAYAC_USERNAME'], :secret_key => ENV['IM_KAYAC_SECRET_KEY']
end

pipe :wget do
  plug Input::HTML, 'http://ffffound.com/'
  plug Filter::Css, 'blockquote td:first-child img'
  plug Filter::Map do |row|
    row.attribute('src').to_s
  end
  plug Output::Wget, '/tmp/ffffound'
end
