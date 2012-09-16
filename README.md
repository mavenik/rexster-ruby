# Rexster::Ruby

Gem to interface Ruby applications with Rexster.

## Installation

Add this line to your application's Gemfile:

    gem 'rexster-ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rexster-ruby

## Usage

config/environments/development.rb
`Rexster::Rest.server_instance = Rexster::Rest.new host: :localhost, port: 8182, graph: :neo4j`

In some class, e.g.: app/models/rackster.rb

```class Rackster

    include Rexster

  end```

Usage:
`rackster = Rackster.new`

`rackster.g.v(1).script("v.out('RELATION')")`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
