module Ratchetio
  class Configuration

    attr_accessor :access_token
    attr_accessor :environment
    attr_accessor :root
    attr_accessor :branch
    attr_accessor :framework
    attr_accessor :endpoint
    attr_accessor :exception_level_filters

    attr_accessor :logger

    # DEFAULT_ENDPOINT = "http://submit.ratchet.io/api/1/item"
    DEFAULT_ENDPOINT = "http://localhost:7007/api/v1/items"

    def initialize
      @endpoint = DEFAULT_ENDPOINT
      @framework = 'Plain'
      @exception_level_filters = {
      }
    end

    # allow params to be read like a hash
    def [](option)
      send(option)
    end
  end
end