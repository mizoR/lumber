# -*- coding: utf-8 -*-

describe Macaroni::Plugin::Output::Ikachan do
  before do
    @ikachan = described_class.new 'http://example.com:5000/', '#test'
  end

  it do
    http = double 'http'
    http.stub :start
    Net::HTTP.stub(:new).and_return(http)

    Net::HTTP.should_receive(:new).with('example.com', 5000)
    http.should_receive(:start)

    @ikachan.exec [{:message => 'Hello World!'}]
  end
end

