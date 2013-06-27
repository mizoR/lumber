# -*- coding: utf-8 -*-
require 'macaroni/plugin/filter'
require 'yaml'

module Macaroni
  module Plugin
    module Filter
      class Deduped < Select
        def initialize(options={})
          @cache_path = options[:cache_path] || '/tmp/macaroni-cache'
          @block = lambda { |entry|
            hash = Digest::MD5.hexdigest(entry.url)
            hash_path = File.join(@cache_path, hash)
            deduped   = !File.exists?(hash_path)

            File.open(hash_path, 'w') do |file|
              file.write({
                :url     => entry.url,
                :title   => entry.title,
                :content => entry.content,
              }.to_yaml)
            end if deduped

            deduped
          }
        end

        def exec(data)
          FileUtils.mkdir_p(@cache_path) if !File.exists?(@cache_path)
          super
        end
      end
    end
  end
end

