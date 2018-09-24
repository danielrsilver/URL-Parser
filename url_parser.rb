class UrlParser
  attr_accessor :scheme, :domain, :port, :path, :fragment_id

    def initialize(url)
      uri = URI::parse(url)
      @scheme = uri.scheme
      @domain = uri.host
      @port = uri.port.to_s
      @path = uri.path.tr("/", "") unless uri.path == "/"
      @query_string = uri.query
      @fragment_id = uri.fragment
      def query_string
        URI.decode_www_form(@query_string).to_h
      end
    end
end

github_url = UrlParser.new "https://github.com/search?q=ruby#stuff"

puts github_url.scheme
puts github_url.domain
puts github_url.port
puts github_url.path
puts github_url.query_string
puts github_url.fragment_id
