require 'pp'
require 'configuration'

class SomeConfiguration

  def cassandra
    @cassandra ||= Cassandra.new
  end

end

class Cassandra
  include Configuration

  attr_accessor :keyspace

  attr_accessor :servers
  attr_accessor :user
  attr_accessor :password

  attr_accessor :connect_timeout
  attr_accessor :timeout
  attr_accessor :retries
end

# specify configurations
conf = SomeConfiguration.new
conf.cassandra.keyspace = 'Some App'
conf.cassandra.servers = %w(node1.example.com:9160
                            node2.example.com:9160
                            node3.example.com:9160)
conf.cassandra.user = 'some-user'
conf.cassandra.password = 'some-password'
conf.cassandra.timeout = 1
conf.cassandra.connect_timeout = 10
conf.cassandra.retries = 5

# something to be configured
require 'settings'

class Thing
  include Settings
  setting :user
  setting :password
end

# configure the thing
thing = Thing.new
conf.cassandra.configure thing
pp thing
