module TimeAgoInWords
  # Convert elapsed seconds from Time.now to the current Time instance
  #   into an English human readable text like '4 hours and 1 minute ago'
  # It is not well suited for dates older than 1 year
  #
  # @return [String] the humanized elapsed time in pairs
  #   Always returns a pair of words like:
  #     '23 days and 3 hours ago'
  #     '5 hours and 44 minutes ago'
  #     ' 1 minute and 11 seconds ago'
  #
  #   Or just 1 when no hours/minutes/seconds available:
  #     '23 days ago'
  #     '17 hours ago'
  #     '1 minute ago'
  #     '1 second ago'
  #
  #   Ẃhen 0 seconds or Time instance is a future date, returns empty string:
  #     ""
  #
  # @note Inspired from http://stackoverflow.com/a/4136485/511069
  def ago_in_words
    secs = Time.now - self
    return 'just now' if secs > -1 && secs < 1
    return '' if secs <= -1
    return 'a very very long time ago' if secs > 60*60*24*100_000
    ary = [[60, :seconds], [60, :minutes], [24, :hours], [100_000, :days]].map{ |count, name|
      if secs > 0
        secs, n = secs.divmod(count)
        "#{n.to_i} #{name}"
      end
    }.compact.reverse[0..1]
    if ary.size == 1
      ary.map! {|part| part[0, 2].to_i == 1 ? part.chomp('s') : part }
    else
      ary.map! {|part| part[0, 2].to_i == 1 ? part.chomp('s') : part[0, 2].to_i == 0 ? nil : part }
    end
    ary.compact!
    ary.size == 0 ? '' : ary.join(' and ') << ' ago'
  end
end
