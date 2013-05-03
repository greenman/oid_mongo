module Rack
  class OpenID
    def initialize(app, store = nil)
      @app = app
      @store = default_store
    end
  end
end


