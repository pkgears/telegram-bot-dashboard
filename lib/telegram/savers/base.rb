require("rest-client")

module Savers
  class Base

    def initialize(attribute)
      @attribute = attribute
    end

    private

    def api_client
      RestClient::Resource.new("http://localhost:3000/api")
    end 
  end
end
