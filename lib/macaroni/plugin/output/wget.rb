# -*- coding: utf-8 -*-
require 'open-uri'

module Macaroni
  module Plugin
    module Output
      class Wget
        def initialize(dirpath='.')
          @dirpath = dirpath
        end

        def exec(data)
          FileUtils.mkdir_p(@dirpath) if !File.exists?(@dirpath)
          data.each do |url|
            uri = URI.parse(url)
            filename = (uri.path =~ %r[/$]) ? \
              'index.html' : File.basename(uri.path)
            filepath = File.join(@dirpath, filename)
            File.open filepath, 'wb' do |dst|
              open(url) do |src|
                dst.write(src.read)
              end
            end
          end
        end
      end
    end
  end
end

