require "./user"

class Blocker
  attr_reader :users

  def initialize(tweet_text)
    @users = []

    parse_tweet(tweet_text)
  end

  def puts_statuses
    @users.each do |u|
      puts
      puts "#{u.handle}'s modes: #{u.modes}"
      puts "#{u.handle} is blocked." if u.blocked?
      puts "#{u.handle} is reported." if u.reported?
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
