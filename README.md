# Ratchetio

Ruby gem for Ratchet.io, for reporting exceptions in Rails 3 to Ratchet.io. Requires a Ratchet.io account (you can sign up for free).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ratchetio'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ratchetio

Then, creat a file config/nitializers/ratchetio.rb containing the following:

```ruby
require 'ratchetio/rails'
Ratchetio.configure do |config|
    conifg.access_token = 'YOUR_RATCHETIO_PROJECT_ACCESS_TOKEN'
end
```

## Usage

This gem installs an exception handler into Rails. You don't need to do anything else for it to work.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ratchetio. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ratchetio project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ratchetio/blob/master/CODE_OF_CONDUCT.md).
