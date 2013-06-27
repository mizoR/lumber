# -*- coding: utf-8 -*-

describe Macaroni::Core::Pipe do
  it '#plug' do
    plugin_class = double(:plugin_class)
    plugin_class.should_receive(:new).exactly(3).times

    pipe = described_class.new
    pipe.send(:plug, plugin_class) {}
    pipe.send(:plug, plugin_class) {}
    pipe.send(:plug, plugin_class) {}
    expect(pipe.instance_eval {@plugins.length}).to be 3
  end

  it '#exec' do
    plugin = double(:plugin)
    plugin.should_receive(:exec).and_return('TEST')

    plugin_class = double(:plugin_class).stub(:new)
    plugin_class.should_receive(:new).and_return(plugin)

    pipe = described_class.new
    pipe.send(:plug, plugin_class) {}
    expect(pipe.exec).to eq 'TEST'
  end
end

