require "./user"

class Parser
  attr_reader :users

  def initialize(tweet_text)
    @users = []

    parse_tweet(tweet_text)
  end

  def puts_statuses
    @users.each do |u|
      puts
      u.puts_status
    end
  end

  def parse_tweet(tweet_text)
    modes = nil
    split_tweet = tweet_text.split

    split_tweet.each do |word|
      modes ||= ""

      case word
      when /^\+/ # a mode string
        modes = word
      when /^@/ # a user
        @users << User.new(word, modes)
        modes = nil
      end
    end
  end
end
