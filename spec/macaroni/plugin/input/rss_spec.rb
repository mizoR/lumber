# -*- coding: utf-8 -*-

describe Macaroni::Plugin::Input::RSS do
  before do
    @url = 'http://example.com/'
    @rss = described_class.new @url
    OpenURI.stub(:open_uri)
    FeedNormalizer::FeedNormalizer.stub(:parse)
  end

  it do
    uri = URI.parse(@url)
    OpenURI.should_receive(:open_uri).with(uri).and_return('')
    FeedNormalizer::FeedNormalizer.should_receive(:parse).and_return ['b']
    expect(@rss.exec(['a'])).to eq ['a', 'b']
  end
end

