# TimeAgoInWords

[![Gem Version][GV img]][Gem Version]
[![Build Status][BS img]][Build Status]
[![Dependency Status][DS img]][Dependency Status]
[![Code Climate][CC img]][Code Climate]
[![Coverage Status][CS img]][Coverage Status]
[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/3fe2425a26ab0ca00b5bc6acf817af59 "githalytics.com")](http://githalytics.com/elgalu/time_ago_in_words)

## Warning

This is just a proof-of-concept gem. Please review the following production-ready suggestions i have for you:

### Rails apps

You can use classic Rails time ago in words

```ruby
time_ago_in_words(Time.now - 60*60*2) + ' ago'
#=> "about 2 hours ago"

# Note that all these returns the same
distance_of_time_in_words(Time.now, 15.seconds.from_now, include_seconds: true)
distance_of_time_in_words(Time.now, 15.seconds.ago, include_seconds: true)
time_ago_in_words(15.seconds.from_now, include_seconds: true)
#=> "less than 20 seconds"
```

For localization or changing the words to be used, look at [this file](https://github.com/rails/rails/blob/master/actionview/lib/action_view/locale/en.yml)

### Non-Rails apps

Same as before but you will need some explicit requires:

```ruby
require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper
time_ago_in_words(Time.now - 60*60*2) + ' ago'
#=> "about 2 hours ago"

# If you need to take advantage of Numeric ActiveSupport extensions:
require 'active_support/core_ext/numeric/time'
time_ago_in_words(Time.now - 2.hours) + ' ago'
#=> "about 2 hours ago"
# note that (Time.now - 2.hours) == (2.hours.ago)
```

### Web apps, client side:

If you are programming for the web and don't want to mess your caching strategies then client-side update libraries came to your rescue:

| Name           | jQuery library     | jQuery + Rails integration |
|:-------------- |:------------------:|:--------------------------:|
| Smart Time Ago | [smart-time-ago][] | [timeago-rails][]          |
| Timeago        | [jquery-timeago][] | [rails-timeago][]          |

[smart-time-ago]: https://github.com/pragmaticly/smart-time-ago
[jquery-timeago]: https://github.com/rmm5t/jquery-timeago
[timeago-rails]: https://github.com/ashchan/timeago-rails
[rails-timeago]: https://github.com/jgraichen/rails-timeago

### [dotiw](https://github.com/radar/dotiw)

If you are looking for results that looks like this

        "1 year, 2 months, 4 hours, 5 minutes, and 6 seconds"
        
There is also [time-lord](https://github.com/krainboltgreene/time-lord) if you want to look around

```ruby
require 'time-lord'
1.hour.ago.to_i                     #=> -3600
200.minutes.ago.to_words            #=> "3 hours ago"
(200.years + 400.days).ago.to_words #=> "201 years ago"
1.hour.ago.to_range                 #=> 1379701707..1379705307
```

### Related: Natural Language Date Parser

If you are working in the opposite direction [chronic][] natural language date parsing to the rescue.

```ruby
require 'chronic' #gem install chronic
Chronic.parse("1 year from now").year #=> 2014
```

The Javascript version of [chronic][] is [date][] and can be used within your browser (client-side) or nodejs (server-side).

## Description

Humanize elapsed time from some Time instance to Time.now, e.g. '2 hours and 1 minute ago'

This gem provides slightly different approach to the others but still needs some work to be production-ready, check [TODO](#todo) section.

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

[chronic]: https://github.com/mojombo/chronic
[date]: https://github.com/matthewmueller/date
