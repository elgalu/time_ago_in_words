require 'spec_helper'

describe TimeAgoInWords do
  it 'should have a version number' do
    expect(TimeAgoInWords::VERSION).not_to be_nil
  end

  describe '#ago_in_words' do
    context 'unsupported dates' do
      it "returns empty string in future dates" do
        expect((Time.now + 1.6).ago_in_words).to eq('')
        expect((Time.now + 100).ago_in_words).to eq('')
        expect((Time.now + 9999).ago_in_words).to eq('')
      end

      it "returns 'a very very long time ago' when more than 300 years ago" do
        expect(Time.local(1713,01,01).ago_in_words).to eq('a very very long time ago')
      end
    end

    context 'valid dates' do
      it "returns 'just now' when elapsed seconds are less than 1" do
        expect(Time.now.ago_in_words).to eq('just now')
        expect((Time.now - 0.5).ago_in_words).to eq('just now')
        expect((Time.now + 0.5).ago_in_words).to eq('just now')
      end

      it "can handle many days ago" do
        expect((Time.now - 60*60*24*9999).ago_in_words).to eq('9999 days ago')
      end

      it "returns N seconds ago, N seconds ago!" do
        expect((Time.now - 2).ago_in_words).to eq('2 seconds ago')
        expect((Time.now - 33).ago_in_words).to eq('33 seconds ago')
      end

      it "returns 1 second/minute/hour/day ago when 1 ago!" do
        expect((Time.now - 1).ago_in_words).to eq('1 second ago')
        expect((Time.now - 60).ago_in_words).to eq('1 minute ago')
        expect((Time.now - 60*60).ago_in_words).to eq('1 hour ago')
        expect((Time.now - 60*60*24).ago_in_words).to eq('1 day ago')
      end

      it "returns 1 second/minute/hour/day and 1 second/minute/hour/day ago when appropriate" do
        expect((Time.now - 1 - 60).ago_in_words).to eq('1 minute and 1 second ago')
        expect((Time.now - 1*60*60 - 60).ago_in_words).to eq('1 hour and 1 minute ago')
        expect((Time.now - 1*60*60*24 - 60*60).ago_in_words).to eq('1 day and 1 hour ago')
      end

      it "returns 1 second/minute/hour/day and 1 second/minute/hour/day ago ignoring third elements (residual irrelevant precisions)" do
        expect((Time.now - 1*60*60 - 60 - 10).ago_in_words).to eq('1 hour and 1 minute ago')
        expect((Time.now - 1*60*60*24 - 1*60*60 - 100).ago_in_words).to eq('1 day and 1 hour ago')
        expect((Time.now - 9*60*60*24 - 3*60*60 - 100).ago_in_words).to eq('9 days and 3 hours ago')
      end
    end
  end
end
