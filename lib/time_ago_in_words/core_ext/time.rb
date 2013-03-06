# Polite monkey patching to add Time#ago_in_words method
class Time
  include TimeAgoInWords
end
