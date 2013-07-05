# -*- coding: utf-8 -*-

describe Macaroni::Plugin::Output::ImKayac do
  before do
    @im_kayac = described_class.new({
      :username => 'macaroni',
      :password => 'macar0ni',
    })
  end

  it do
    http = double 'http'
    http.stub :start
    Net::HTTP.stub(:new).and_return(http)

    Net::HTTP.should_receive(:new).with('im.kayac.com', 80)
    http.should_receive(:start)

    @im_kayac.exec [{:message => 'Hello World!'}]
  end
end

