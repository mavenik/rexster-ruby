require 'rexster-ruby/rexster/rest'

module Rexster

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def server
      @@server ||= Rest.server_instance || Rest.new
    end

    def server=(server_object)
      @@server = server_object
    end
  end

  module InstanceMethods
    def g
      @g ||= self.class.server.graph
      self
    end

    def v(vertex_id)
     @v = vertex_id
     self
    end

    def e(edge_id)
      @e = edge_id
      self
    end

    def script(gremlin_script)
      @script = gremlin_script
      self.inspect
    end

    def inspect
      return super if not @g and not (@v and @e)
      self.class.server.execute build_url, @script
    end

    def all
      self.to_a
    end

    def to_a
      Array.wrap self.inspect
    end

    private
    def build_url
      script = [
                self.class.server.base_url,
                "graphs",
                "#{@g}",
                ("vertices/#{@v}" if !!@v),
                ("edges/#{@e}" if !!@e),
                "tp",
                "gremlin"
                ].compact.join("/")
    end
  end


end
