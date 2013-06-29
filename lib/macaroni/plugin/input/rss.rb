# -*- coding: utf-8 -*-
require 'feed-normalizer'

module Macaroni
  module Plugin
    module Input
      class RSS
        def initialize(url)
          @url = url
        end

        def exec(data)
          feed = FeedNormalizer::FeedNormalizer.parse open(@url)
          data + feed.entries
        end
      end
    end
  end
end
