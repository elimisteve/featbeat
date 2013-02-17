app = User.get_app_from_entity('https://adamloving.tent.is')

post = { "permissions" => {"public"=>true, "entities"=>{}}, "type"=>"https://tent.io/types/post/status/v0.1.0", "content"=>{"text"=>"test via tent-client"}}

client = TentClient.new('https://adamloving.tent.is', :mac_key_id => app[:mac_key_id], :mac_key => app[:mac_key], :mac_algorithm => app[:mac_algorithm])
client = TentClient.new('https://adamloving.tent.is', user.mac_key_id, user.mac_key, user.mac_algorithm)

client.post.create(post) # => 404
client.post.create(post, :url => 'http://adamloving.tent.is/tent/posts') # 301 moved
client.post.create(post, :url => 'https://adamloving.tent.is/tent/posts') # 403


client.post.count
client.following.list # => HTML page
client.post.list # => HTML page (https://adamloving.tent.is/posts)


#<Faraday::Response:0x007f8206df1bc0 @env={:method=>:post, 
:body=>{"error"=>"Unauthorized"}, 
:url=>#<URI::HTTPS:0x007f8205421308 URL:https://adamloving.tent.is/tent/posts>, 
:request_headers=>{"Content-Type"=>"application/vnd.tent.v0+json", "Accept"=>"application/vnd.tent.v0+json", 
"Authorization"=>"MAC id=\"a:XSil1zy2sGW6DBl44YKB3Q\", ts=\"1360469913\", nonce=\"9cbf6b\", mac=\"9821DbPsZg/dHRCRD8s5d20R9f4Btipg3b7hyF94jdM=\""}, 
:parallel_manager=>nil, :request=>{:proxy=>nil}, :ssl=>{}, :status=>403, 
:response_headers=>{"server"=>"nginx", "date"=>"Sun, 10 Feb 2013 04:18:34 GMT", "content-type"=>"application/vnd.tent.v0+json; charset=utf-8", 
"transfer-encoding"=>"chunked", "connection"=>"close", "status"=>"403 Forbidden", 
"request-id"=>"e728b2d0-5864-4d8e-a390-0ebb21458db8", "strict-transport-security"=>"max-age=31536000; includeSubDomains"}, 
:response=>#<Faraday::Response:0x007f8206df1bc0 ...>}, @on_complete_callbacks=[]> 


x = TentClient.new.discover("http://adamloving.tent.is")
client = x.instance_variable_get('@client')

client = TentClient.new('https://adamloving.tent.is/tent', :mac_key_id => user.mac_key_id, :mac_key => user.mac_key, :mac_algorithm => user.mac_algorithm)
client.profile.get