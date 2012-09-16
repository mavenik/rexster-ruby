class Rexster::Rest
  include ::HTTParty

  def initialize(options={})
    options ||= {}
    @protocol = options[:protocol] || :http
    @host = options[:host] || :localhost
    @port = options[:port] || 8182
    @graph = options[:graph] || :tinkergraph
  end

  def self.server_instance
    @@server ||= new
  end

  def self.server_instance=(server_object)
    @@server = server_object
  end

  def graph
    @graph
  end

  def base_url
    [
      "#{@protocol}://",
      @host,
      (":#{@port}" if !!@port)
    ].compact.join
  end

  def execute url, script
    response = self.class.post "#{url}", body: {script: script}
    response = response.parsed_response

    if not response['success']
      raise RexsterError.new("Graph server returned error: #{response['error']}")
    end

    response = response['results']
    response = response.first if response.length <= 1
    response
  end

  private
  class RexsterError < StandardError; end
end
