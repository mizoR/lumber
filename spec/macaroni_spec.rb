# -*- coding: utf-8 -*-
require 'spec_helper'

describe Macaroni do
  it do
    expect(Macaroni).to respond_to :main
  end

  it do
    expect(Macaroni).to respond_to :application
  end

  it do
    expect(Macaroni::application).to be Macaroni::Core::Application.instance
  end
end

