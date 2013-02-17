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

    # BUGBUG: use user.core_profile["servers"] (or discovery.get_profile)

    url = discovery.profile_urls.first.gsub(/profile/, 'posts')
    client = TentClient.new(user.entity, :mac_key_id => user.mac_key_id, :mac_key => user.mac_key, :mac_algorithm => user.mac_algorithm)
    client.post.create(post, :url => url)
  end

  # {"name"=>"Adam Loving", "avatar_url"=>"", "birthdate"=>"", "location"=>"", "gender"=>"", "bio"=>"This account posts the daily life accomplishments that I share through my Tent app called Featbeat.", "website_url"=>"http://featbeat.adamloving", "permissions"=>{"groups"=>[], "entities"=>{}, "public"=>true}, "version"=>2}
  def self.get_profile(user)
    url = user.entity + (user.entity.ends_with?('/') ? 'tent' : '/tent')
    client = TentClient.new(url, :mac_key_id => user.mac_key_id, :mac_key => user.mac_key, :mac_algorithm => user.mac_algorithm)
    response = client.profile.get
    response.body["https://tent.io/types/info/basic/v0.1.0"]
  end

end