source 'https://rubygems.org'

# Specify your gem's dependencies in time_ago_in_words.gemspec
gemspec

group :development do
  gem 'pry'     # core replacement for irb
  gem 'pry-doc' # gives MRI core documentation and source code
  unless RUBY_PLATFORM == 'java'
    gem 'redcarpet', '>= 3'  # redcarpet doesn't currently works with jruby. kramdown is a possible alternative
    gem 'yard', '>= 0.8.7.3' # no need to generate yard docs from jruby
    gem 'pry-stack_explorer' # adds command `show-stack`
    gem 'pry-debugger'       # adds commands `continue, step, next, finish`
  end
end
