# -*- coding: utf-8 -*-

describe Macaroni::Plugin::Filter do
  context do
    it do
      ancestors = Macaroni::Plugin::Filter::Each.ancestors
      expect(ancestors).to include(Macaroni::Plugin::Filter::Base)
    end
  end

  context do
    it do
      to_i_filter = Macaroni::Plugin::Filter::ToI.new
      expect(to_i_filter.exec('1')).to be 1
    end
  end
end

