# -*- coding: utf-8 -*-
require 'net/http'

module Macaroni
  module Plugin
    module Output
      class Ikachan
        def initialize(base_url, channel)
          @base_url = base_url
          @channel  = channel
        end

        def exec(data)
          return data if data.empty?

          uri = URI.parse "#{@base_url}"
          Net::HTTP.new(uri.host, uri.port).start do |http|
            data.each do |row|
              request = Net::HTTP::Post.new('/join')
              request.set_form_data(:channel => @channel)
              http.request(request)

              request = Net::HTTP::Post.new('/notice')
              request.set_form_data(:channel => @channel, :message => row[:message])
              http.request(request)

              if row[:handler]
                request = Net::HTTP::Post.new('/notice')
                request.set_form_data(:channel => @channel, :message => row[:handler])
                http.request(request)
              end
            end
          end
        end
      end
    end
  end
end

