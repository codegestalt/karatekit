require "kampfsport/version"
require "kampfsport/credentials"
require "kampfsport/errors"
require "kampfsport/base"

module Kampfsport
  class << self
    def client(endpoint: nil, access_token: nil)
      Kampfsport::Base.new(endpoint: endpoint, access_token: access_token)
    end
  end
end
