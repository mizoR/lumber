# -*- coding: utf-8 -*-
require 'spec_helper'

describe Macaroni::Plugin::Output::Wget do
  before do
    @response_body = 'Hello World'
    @dirpath = './tmp'
    @wget = described_class.new(@dirpath)
  end

  it do
    FileUtils.stub(:mkdir_p)
    FileUtils.should_receive(:mkdir_p).with(@dirpath)

    resource = double 'resource'
    resource.stub(:read).and_return(@response_body)
    OpenURI.stub(:open_uri).and_yield(resource)

    file = StringIO.new
    File.stub(:open).and_yield(file)

    @wget.exec ['http://example.com/']
    expect(file.string).to eq @response_body
  end
end

