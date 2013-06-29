# Macaroni [![Build Status](https://secure.travis-ci.org/mizoR/macaroni.png)](https://travis-ci.org/mizoR/macaroni) [![Code Climate](https://codeclimate.com/github/mizoR/macaroni.png)](https://codeclimate.com/github/mizoR/macaroni) [![Coverage Status](https://coveralls.io/repos/mizoR/macaroni/badge.png?branch=master)](https://coveralls.io/r/mizoR/macaroni?branch=master)


Macaroni is a ruby DSL for easily feed agregation and pipeline processing.

```
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
```

## Installation

Add this line to your application's Gemfile:

    gem 'macaroni'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install macaroni

## Usage

Recipe's sample:

```
# my_recipe.rb

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
```

Start with:

```
macaroni --recipe my_recipe.rb --target news
```

Output

```
{:title=>"Plaintiffs in Calif. marriage case marry in SF", :url=>"http://news.yahoo.com/plaintiffs-calif-marriage-case-marry-sf-000449812.html"}
{:title=>"Obama yet to have African legacy like predecessors - Houston Chronicle", :url=>"http://news.google.com/news/url?sa=t&fd=R&usg=AFQjCNGQLT2e30BTh-bVNWOZSPN6hbqFkQ&url=http://www.chron.com/news/politics/article/Obama-yet-to-have-African-legacy-like-predecessors-4630606.php"}
{:title=>"Plaintiffs in Calif. gay marriage case wed in SF", :url=>"http://news.yahoo.com/plaintiffs-calif-gay-marriage-case-wed-sf-235831059.html"}
{:title=>"End of era as Celtics rebuild without Pierce", :url=>"http://news.yahoo.com/end-era-celtics-rebuild-without-pierce-203533133.html"}
{:title=>"'Preposterous' to suggest Cartwright betrayed US, lawyer says - NBCNews.com", :url=>"http://news.google.com/news/url?sa=t&fd=R&usg=AFQjCNGt8aynSXvEm0sAYhjJKPVTMMp7Kg&url=http://www.nbcnews.com/video/nightly-news/52345858/"}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
