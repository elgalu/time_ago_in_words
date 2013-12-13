source 'https://rubygems.org'

# Specify your gem's dependencies in time_ago_in_words.gemspec
gemspec

group :development do
  gem 'pry'     # core replacement for irb
  gem 'pry-doc' # gives MRI core documentation and source code
end

unless %w(jruby rbx).include? RUBY_ENGINE
  group :test do
    gem 'simplecov', '>= 0.8.2'
    gem 'coveralls', '>= 0.7.0' # no need to run
  end

  group :development do
    gem 'redcarpet', '>= 3'  # redcarpet doesn't currently works with jruby nor rbx. kramdown is a possible alternative
    gem 'yard', '>= 0.8.7.3' # no need to generate yard docs from jruby nor rbx
    gem 'pry-stack_explorer' # adds command `show-stack`
    gem 'pry-debugger'       # adds commands `continue, step, next, finish`
  end
end

gem 'rubysl' if RUBY_ENGINE == 'rbx'
