require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start unless RUBY_PLATFORM == 'java'

# Internal
require 'time_ago_in_words'

# Require this file using `require "spec_helper"` within each of your specs
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random' # Run specs in random order to surface order dependencies.
  config.expect_with :rspec do |c|
    c.syntax = :expect  # disable `should` syntax  http://goo.gl/BGxqP
  end
end
