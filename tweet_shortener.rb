require 'pry'

#if word in dict, it replaces it
#this is broken
def check_in_dict(word)
  dictionary = {
    "hello" => 'hi',
    "to" => '2',
    "two" => '2',
    "too" => '2',
    "for" => '4',
    "four" => '4',
    'be' => 'b',
    'you' => 'u',
    "at" => "@",
    "and" => "&"
  }

  dcase_word = word.downcase
  if dictionary.keys.include? dcase_word
    dictionary[dcase_word]
  else
    word
  end
end

def word_substituter(long_tweet)
  tweet_list = long_tweet.split
  tweet_list.map! do |word|
    check_in_dict(word)
  end

  return tweet_list.join(' ')
end

def bulk_tweet_shortener(tweets)
  tweets.map { |tweet| puts word_substituter(tweet) }
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    return word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  if tweet.length > 140
    selective_tweet_shortener(tweet)[0...140]
  else
    tweet
  end
end
