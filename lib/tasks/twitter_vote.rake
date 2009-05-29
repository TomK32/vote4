namespace :twitter do
  namespace :vote do
    desc "update"
    task :update => :environment do
      require 'twitter_auth'
      include
      class BasicUser < User; include TwitterAuth::BasicUser; attr_accessor :password; end
      TwitterAuth.config['strategy'] = 'basic'
      agent = BasicUser.new(TwitterAuth.config['user'])
      parser = Ananasblau::Parsers::Vote.new
      #agent = TwitterAuth::Dispatcher::Basic.new(agent)
      agent.twitter.get('/replies').reverse.each do |reply|
        puts y reply['text']
        user = User.find_and_update_or_create(reply['user'])
        reply_type, data = parser.parse(reply['text'])
        
        case reply_type
        when :create
          voting = user.votings.find_or_initialize_by_question(data[:question])
          voting.tweet_id = reply['id']
          voting.options = data[:options]
          voting.created_at = reply['created_at']
          if ! voting.save
            logger.error("Couldn't create voting in http://twitter.com/%s/status/%s" % [reply['user']['screen_name'], reply['id']])
          end
          # let user know about
          agent.twitter.post('/statuses/update.json', 'status' => '@%s created a new voting #%s' % [user.login, voting.permalink])
        when :vote
          if data[:user_screen_name]
            voting = Voting.recent.find_by_user_login(data[:user_screen_name])
          elsif data[:id]
            voting = Voting.find_by_permalink(data[:id])
            voting ||= Voting.find_by_id(data[:id].to_i)
          else
            logger.error("Couldn't find voting id in http://twitter.com/%s/status/%s" % [reply['user']['screen_name'], reply['id']])
          end
          if voting.nil?
            logger.error("Couldn't process vote for %s in http://twitter.com/%s/status/%s" % [data[:id] || data[:user_screen_name], reply['user']['screen_name'], reply['id']])
          else
            # only add the new votes
            next if voting.created_at.utc > DateTime.parse(reply['created_at'])
            vote = voting.votes.find_or_initialize_by_user_id(user.id)
            vote.option = data[:option]
            vote.tweet_id = reply['id']
            vote.created_at = reply['created_at']
            if ! vote.save
              logger.error("Couldn't save vote in http://twitter.com/%s/status/%s" % [reply['user']['screen_name'], reply['id']])
            end
          end
        end
      end
    end
  end
end

def logger
  @@logger ||= Logger.new("log/twitter.log")
end