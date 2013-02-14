class TentHelper

  def self.post(user, text)
    post = { 
      permissions: {
        public: true,
        entities: {}
      }, 
        type: 'https://tent.io/types/post/status/v0.1.0',
        content: {
          text: text
        }
    }
    
    discovery = TentClient.new.discover(User.last.entity)
    url = discovery.profile_urls.first.gsub(/profile/, 'posts')
    client = TentClient.new(user.entity, :mac_key_id => user.mac_key_id, :mac_key => user.mac_key, :mac_algorithm => user.mac_algorithm)
    client.post.create(post, :url => url)
  end

end