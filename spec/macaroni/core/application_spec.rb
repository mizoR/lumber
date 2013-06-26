# -*- coding: utf-8 -*-
require 'spec_helper'

describe Macaroni::Core::Application do
  let :application do
    Macaroni::Core::Application.instance
  end

  context '#new' do
    it do
      pipes = application.instance_eval {@pipes}
      expect(pipes).to eq({})
    end
  end

  context '#set_pipe' do
    before do
      @pipe = double('pipe')
      @pipe.stub(:exec).and_return('test')
      application.set_pipe(:test, @pipe)
    end

    it do
      expect(application.instance_eval {@pipes[:test]}).to be @pipe
    end
  end

  context '#exec_pipe' do
    before do
      pipe = double('pipe')
      pipe.stub(:exec).and_return('TEST')
      application.set_pipe(:test, pipe)
    end

    it do
      expect(application.exec_pipe('test')).to eq 'TEST'
    end
  end
end

