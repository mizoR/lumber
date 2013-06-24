# -*- coding: utf-8 -*-
require 'feed-normalizer'

module Macaroni
  module Plugin
    module Input
      class RSS
        def initialize(url)
          @feed = FeedNormalizer::FeedNormalizer.parse open(url)
        end

        def exec(data)
          data + @feed.entries
        end
      end
    end
  end
end
