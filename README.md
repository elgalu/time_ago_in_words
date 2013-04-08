# TimeAgoInWords

[![Gem Version][GV img]][Gem Version]
[![Build Status][BS img]][Build Status]
[![Dependency Status][DS img]][Dependency Status]
[![Code Climate][CC img]][Code Climate]
[![Coverage Status][CS img]][Coverage Status]

## Description

Humanize elapsed time from some Time instance to Time.now, e.g. '2 hours and 1 minute ago'

## Installation

`$ gem install time_ago_in_words` or add to your [Gemfile][] this line: `gem 'time_ago_in_words'` then run [bundle install][]

## Usage

Just `require 'time_ago_in_words'` and then call Time#ago_in_words method:

```ruby
require 'time_ago_in_words'

# Comparing from now:
(Time.now - 10).ago_in_words #=> "10 seconds ago"
(Time.now - 1).ago_in_words  #=> "1 second ago"
(Time.now - 60).ago_in_words #=> "1 minute ago"
(Time.now - 63).ago_in_words #=> "1 minute and 3 seconds ago"

# This is my current time so you can compare
Time.now #=> 2013-03-06 02:19:23 -0300

Time.local(1981,03,03,20,30,40).ago_in_words #=> "690 days and 5 hours ago"
Time.local(2013,03,03,20,30,40).ago_in_words #=> "2 days and 5 hours ago"
Time.local(2013,03,04,20,30,40).ago_in_words #=> "1 day and 5 hours ago"
Time.local(2013,03,05,20,30,40).ago_in_words #=> "5 hours and 48 minutes ago"
Time.local(2013,03,05,21,13,40).ago_in_words #=> "5 hours and 5 minutes ago"
Time.local(2013,03,06,00,30,40).ago_in_words #=> "1 hour and 48 minutes ago"
Time.local(2013,03,06,01,11,40).ago_in_words #=> "1 hour and 7 minutes ago"
Time.local(2013,03,06,01,27,40).ago_in_words #=> "51 minutes and 43 seconds ago"
Time.local(2013,03,06,02,19,20).ago_in_words #=> "3 seconds ago"
```

## Contributing

1. Fork it.
2. Make your feature addition or bug fix and create your feature branch.
3. Update the [Change Log][].
3. Add specs/tests for it. This is important so I don't break it in a future version unintentionally.
4. Commit, create a new Pull Request.
5. Check that your pull request passes the [build][travis pull requests].

### TODO
+ Add DateTime support. Currently only available for Time objects.
+ Add "N months ago"
+ Add "N years ago"
+ Add "N decades ago"
+ Add "N centuries ago"
+ Add more rspec Examples
+ Implement Time mocking for testing, instead of abusing Time.now on spec
+ Extract [time_ago_in_words][] and implement that alternative precision syntax, e.g. "less than a minute ago"

## License

Released under the MIT License. See the [LICENSE][] file for further details.

## Links

[RubyGems][] | [Documentation][] | [Source][] | [Bugtracker][] | [Build Status][] | [Dependency Status][] | [Code Climate][]


[bundle install]: http://gembundler.com/v1.3/man/bundle-install.1.html
[Gemfile]: http://gembundler.com/v1.3/gemfile.html
[LICENSE]: LICENSE.md
[Change Log]: CHANGELOG.md

[RubyGems]: https://rubygems.org/gems/time_ago_in_words
[Documentation]: http://rubydoc.info/gems/time_ago_in_words
[Source]: https://github.com/elgalu/time_ago_in_words
[Bugtracker]: https://github.com/elgalu/time_ago_in_words/issues

[travis pull requests]: https://travis-ci.org/elgalu/time_ago_in_words/pull_requests

[Gem Version]: https://rubygems.org/gems/time_ago_in_words
[Build Status]: https://travis-ci.org/elgalu/time_ago_in_words
[Dependency Status]: https://gemnasium.com/elgalu/time_ago_in_words
[Code Climate]: https://codeclimate.com/github/elgalu/time_ago_in_words
[Coverage Status]: https://coveralls.io/r/elgalu/time_ago_in_words

[GV img]: https://badge.fury.io/rb/time_ago_in_words.png
[BS img]: https://travis-ci.org/elgalu/time_ago_in_words.png
[DS img]: https://gemnasium.com/elgalu/time_ago_in_words.png
[CC img]: https://codeclimate.com/github/elgalu/time_ago_in_words.png
[CS img]: https://coveralls.io/repos/elgalu/time_ago_in_words/badge.png?branch=master

[time_ago_in_words]: http://apidock.com/rails/ActionView/Helpers/DateHelper/time_ago_in_words
