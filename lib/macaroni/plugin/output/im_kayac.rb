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

        def exec(entries)
          uri = URI.parse "#{@base_url}#{@username}"

          Net::HTTP.new(uri.host, uri.port).start do |http|
            entries.each do |entry|
              sig = @secret_key ? \
                Digest::SHA1.new.update("#{entry.title}#{@secret_key}").to_s : nil

              request = Net::HTTP::Post.new(uri.path)
              request.set_form_data(
                :handler  => entry.url,
                :password => @password,
                :sig      => sig,
                :message  => entry.title,
              )
              http.request(request)
            end
          end
        end
      end
    end
  end
end

