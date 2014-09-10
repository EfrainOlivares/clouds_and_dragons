# CloudsAndDragons

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clouds_and_dragons'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install clouds_and_dragons

## Usage

Copy the config/login.yml.example file to config/login.yml, choose an autherntication method 
and enter the requested data (making sure to comment out the unused methoods).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/clouds_and_dragons/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

### Testing

To test cnr, install bats (https://github.com/sstephenson/bats) and run `bats test/*.bats`
