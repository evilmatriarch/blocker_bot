require "./user"

# example tweet
tweet_text = "+b @butthead +br @abuser +r @spammer random+word @cool_dude"

split_tweet = tweet_text.split

users = []

split_tweet.each do |word|
  $modes ||= ""

  case word
  when /^\+/ # a mode string
    $modes = word
  when /^@/ # a user
    users << User.new(word, $modes)
    $modes = nil
  end
end

users.each do |u|
  puts
  puts "#{u.handle}'s modes: #{u.modes}"
  puts "#{u.handle} is blocked." if u.blocked?
  puts "#{u.handle} is reported." if u.reported?
end
