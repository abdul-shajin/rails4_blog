class HomeController < ApplicationController
    require 'json'
	def index

	end

	def ezee_login
	 #send a GET request to server
     c_get = HTTParty.get("https://67.228.194.218:2087/login")  
     #POST request with credentials
     c_post = HTTParty.post("https://67.228.194.218:2087/login/?login_only=1",:body=>{:user=>'username',:pass=>'password'},:headers => {'Cookie' => c_get.headers['set-cookie']})
     token = JSON.load(d.body)['security_token']
     session_val = c_post.headers["set-cookie"].scan(/session=([^\;]+)/).flatten
     #redirect to cpanel/whmcs URL with unique session value
     redirect_to "https://67.228.194.218:2087#{token}/login/?session=#{session_val.first}"
=begin
    c = Curl::Easy.new("http://67.228.194.218:2082/")
    c.http_auth_types = :basic
    c.username = 'egwdemo'
    c.password = 'ajishajin123'
    uri = Addressable::URI.new
    uri.query_values = {user:'egwdemo',pass:'ajishajin123',goto_uri:'/',login_only:1}
    p uri.query
    #c.setopt(:CURLOPT_POSTFIELDS, uri.query)
    #c.setopt(:CURLOPT_POSTFIELDS, '&user=egwdemo&pass=ajishajin123&goto_uri=/')
    c.setopt(:CURLOPT_HEADER, true)
    c.setopt(:CURLOPT_RETURNTRANSFER, true)
    c.setopt(:CURLOPT_POST, true)
    c.setopt(:CURLOPT_POSTFIELDS, uri.query)
    c.setopt(:CURLOPT_HTTPHEADERS,['Connection: close'])
    c.setopt(:CURLOPT_FOLLOWLOCATION, 1)
    c.setopt(:CURLOPT_COOKIEJAR,'my_cookie_jar.txt')
    c.setopt(:CURLOPT_COOKIEFILE, 'my_cookie.txt')
    c.perform
    p c.header_str
    p c.body_str
    #p c.header_str
    #result = c.body_str.scan(/session=([^\;]+)/)
    #p result rescue 'aji - rescue'
    #p "http://egluewebdemo.com:2082/login/cprssss/#{result[1]}"
    #p '####################################3'
    #p c.body_str
=end

=begin
      agent = Mechanize.new
      #agent.add_auth('Basic','egwdemo','ajishajin123')
      p 'inside something something !!!!!!!!!!!!!!!!!!!!!'
      page = agent.get('http://egluewebdemo.com:2082') do |pg|
        puts pg.title
      end

      form = agent.page.form_with(:action => '/login/')
      form.field_with(:name => 'user').value = 'egwdemo'
      form.field_with(:name => 'pass').value = 'ajishajin123'
      p 'inside something something !!!!!!!!!!!!!!!!!!!!!'
      page = form.submit form.buttons.first

      @a = []
      page.links.each do |link|
        text = link.text.strip
        @a << text
        next unless text.length > 0 
      end
=end
=begin
    response = Typhoeus.get(
      "egluewebdemo.com:2082/login/",
       params: {user:'egwdemo',pass:'ajishajin123',goto_uri:'/'},
       followlocation: true
    )
    #p response.headers
    #redirect_to response.effective_url
=end
	end

end
