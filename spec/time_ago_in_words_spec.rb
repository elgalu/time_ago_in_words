require 'spec_helper'

describe TimeAgoInWords do
  it 'should have a version number' do
    TimeAgoInWords::VERSION.should_not be_nil
  end

  describe '#ago_in_words' do
    context 'invalid dates' do
      it "returns 'just now' when elapsed seconds are less than 1" do
        Time.now.ago_in_words.should == 'just now'
        (Time.now - 0.5).ago_in_words.should == 'just now'
        (Time.now + 0.5).ago_in_words.should == 'just now'
      end

      it "returns empty string on future dates" do
        (Time.now + 1.6).ago_in_words.should == ''
        (Time.now + 100).ago_in_words.should == ''
        (Time.now + 9999).ago_in_words.should == ''
      end

      it "returns 'a very very long time ago' when more than 250 years ago" do
        Time.local(1700,01,01).ago_in_words.should == 'a very very long time ago'
      end

      it "can handle many days ago" do
        (Time.now - 60*60*24*9999).ago_in_words.should == '9999 days ago'
      end

      it "returns N seconds ago, N seconds ago!" do
        (Time.now - 2).ago_in_words.should == '2 seconds ago'
        (Time.now - 33).ago_in_words.should == '33 seconds ago'
      end

      it "returns 1 second/minute/hour/day ago when 1 ago!" do
        (Time.now - 1).ago_in_words.should        == '1 second ago'
        (Time.now - 60).ago_in_words.should       == '1 minute ago'
        (Time.now - 60*60).ago_in_words.should    == '1 hour ago'
        (Time.now - 60*60*24).ago_in_words.should == '1 day ago'
      end

      it "returns 1 second/minute/hour/day and 1 second/minute/hour/day ago when appropriate" do
        (Time.now - 1 - 60).ago_in_words.should             == '1 minute and 1 second ago'
        (Time.now - 1*60*60 - 60).ago_in_words.should       == '1 hour and 1 minute ago'
        (Time.now - 1*60*60*24 - 60*60).ago_in_words.should == '1 day and 1 hour ago'
      end

      it "returns 1 second/minute/hour/day and 1 second/minute/hour/day ago ignoring third elements (residual irrelevant precisions)" do
        (Time.now - 1*60*60 - 60 - 10).ago_in_words.should        == '1 hour and 1 minute ago'
        (Time.now - 1*60*60*24 - 1*60*60 - 100).ago_in_words.should == '1 day and 1 hour ago'
        (Time.now - 9*60*60*24 - 3*60*60 - 100).ago_in_words.should == '9 days and 3 hours ago'
      end
    end
  end
end
