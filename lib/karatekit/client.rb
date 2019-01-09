# frozen_string_literal: true
require "http"
require "json"

module Karatekit
  class Client
    # DEFAULT_HOST = "https://api.kampfsport.center/v1"
    DEFAULT_HOST = "http://api.kampfsport.test/v1"

    attr_accessor :access_token

    def initialize(access_token: ENV['KAMPFSPORT_ACCESS_TOKEN'])
      @access_token = access_token.to_s

      if access_token.length == 0
        raise ArgumentError.new("Access token is required. Access token: '#{@access_token}'.")
      end
    end

    def locations(opts = {})
      Karatekit::Models::Locations.new(get("locations", opts), opts, client: self)
    end

    def get(path, opts = {})
      url = "#{DEFAULT_HOST}/#{path}"
      url += "?#{opts.map {|k, v| "#{k}=#{v}"}.join("&")}" if opts.any?
      uri = URI(url)
      response = http_response(:get, uri)
      JSON.parse(response.body)
    end

  private

    def http_response(method, uri, opts = {})
      response = nil

      http = HTTP["User-Agent" => "kampfsport.center Ruby Gem",
                  "Authorization" => "Bearer #{@access_token}"]
      params = {}
      if opts[:body]
        params[:json] = opts[:body]
      end
      response = http.send(method, uri, params)

      raise Karatekit::AuthenticationError.new(response.to_s) if auth_error?(response)
      raise Karatekit::UnprocessableRequest.new(response.to_s) if response.code.to_i == 422

      response
    end

    def auth_error?(response)
      response.code.to_i == 403 || response.code.to_i == 401
    end
  end
end
