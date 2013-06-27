# -*- coding: utf-8 -*-

module Macaroni
  module Plugin
    module Output
      class ImKayac
        def initialize(params={})
          @base_url   = "http://im.kayac.com/api/post/"
          @username   = params[:username] or raise ArgumentError
          @password   = params[:password]   || nil
          @secret_key = params[:secret_key] || nil
        end

        def exec(data)
          return data if data.empty?

          uri = URI.parse "#{@base_url}#{@username}"
          Net::HTTP.new(uri.host, uri.port).start do |http|
            data.each do |row|
              sig = @secret_key ? \
                Digest::SHA1.new.update("#{row[:message]}#{@secret_key}").to_s : nil

              request = Net::HTTP::Post.new(uri.path)
              request.set_form_data(
                :handler  => row[:handler],
                :password => @password,
                :sig      => sig,
                :message  => row[:message]
              )
              http.request(request)
            end
          end
        end
      end
    end
  end
end

