require 'macaroni/version'
require 'macaroni/core/application'
require 'macaroni/core/pipe'
require 'macaroni/plugin/input/rss'
require 'macaroni/plugin/input/html'
require 'macaroni/plugin/filter'
require 'macaroni/plugin/filter/deduped'
require 'macaroni/plugin/output/stdout'
require 'macaroni/plugin/output/im_kayac'
require 'macaroni/plugin/output/ikachan'
require 'optparse'

module Macaroni
  def self.application
    Core::Application.instance
  end

  def self.main(argv)
    options = {:recipe => 'recipe', :target => 'default'}
    OptionParser.new.tap do |opt|
      opt.on('--recipe [RECIPE]') {|v| options[:recipe] = v}
      opt.on('--target [TARGET]') {|v| options[:target] = v}
      opt.parse!(argv)
    end

    load File.join(Dir.pwd, options[:recipe])
    application.exec_pipe(options[:target])
  end
end
