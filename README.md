# Hundredth

Writes out 1 to 100 their full ordinal words. 101 and greater are are written out using the number
followed by the ordinal indicator, e.g. 'st', 'nd', 'rd'.

For example:
1 = first
2 = second
100 = hundredth
101 = 101st

### Aren't there other ordinal gems?
Yeah, there are. However, they either are not internationalized or have bugs.

### Why didn't you just fix the bugs in other gems?
Cuz, I took this to be an opportunity to write my own gem to get experience with
internationalizing a gem and creating a gem with unit tests.

### What languages are currently supported?
English
French*
Spanish*

\* Are not supported over 100

## Installation

Add this line to your application's Gemfile:

    gem 'hundredth'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hundredth

## Usage

Once hundredth is added as a gem, then you basically call it this way.

    Hundredth.ordinal(2)

The above call with use the current locale. If you want to pass in a different locale then you can
call it like this:

    Hundredth.ordinal(2, 'en')

You can also set the default locale:

    Hundredth.default_locale = 'en'

## Contributing

1. Fork it ( https://github.com/jcavalieri/hundredth/fork )
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Make your changes to code and tests
1. Test it
    ```
    bundle install
    bundle exec ruby -Ilib:test test/*
    ```
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create a new Pull Request
