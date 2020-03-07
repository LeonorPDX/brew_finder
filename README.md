# Brew Finder

Welcome to Brew Finder. This is a CLI application to find breweries and cideries by location in the United States. It uses an API, Open Brewery DB, to fetch results. To run the program enter bin/brew_finder. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'brew_finder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install brew_finder
    
Prerequisites: This API does not require a key. This gem includes 'httparty' and 'colorize'. So when you run bundle install this library should be installed. If not then include 'httparty' and 'colorize' in your gem file.

## Usage

Enter bin/brew_finder in the command line and follow program prompts to get information on breweries near you.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'jovial-environment-1521'/brew_finder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BrewFinder project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'jovial-environment-1521'/brew_finder/blob/master/CODE_OF_CONDUCT.md).
