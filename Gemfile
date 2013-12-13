source 'https://rubygems.org'

# Specify your gem's dependencies in time_ago_in_words.gemspec
gemspec

unless RUBY_PLATFORM == 'java'
  group :development do
    gem 'pry'                # core replacement for irb
    gem 'pry-doc'            # gives MRI core documentation and source code
    gem 'pry-stack_explorer' # adds command `show-stack`
    gem 'pry-debugger'       # adds commands `continue, step, next, finish`
  end
end
