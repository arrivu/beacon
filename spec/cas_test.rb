
#!/usr/bin/env ruby

# Enables UTF-8 compatibility in ruby 1.8.
$KCODE = 'u' if RUBY_VERSION < '1.9'

require 'rubygems'

$:.unshift File.dirname(__FILE__) + "/../lib"

if ARGV.join.match('--debugger')
  require 'ruby-debug'
  puts
  puts "=> Debugger Enabled"
end

if ARGV.join.match('-c')
  c = ARGV.join.match(/-c\s*([^\s]+)/)
  if (c && c[1])
    ENV['CONFIG_FILE'] = c[1]
    puts
    puts "=> Using custom config file #{ENV['CONFIG_FILE'].inspect}"
  else
    $stderr.puts("To specify a custom config file use `rubycas-server -c path/to/config_file_name.yml`.")
    exit
  end
end


class CASLoginResponse
  attr_accessor :type, :tgt, :msg

  def initialize(params)
    attrs = %w(type tgt)
    attrs.each { |attr| self.instance_variable_set("@#{attr}", params[attr]) }
    message = params["message"]
    @msg = message["untranslated_path"]
  end
end

require 'rest_client'
require 'json'

def login(url, payload, headers={}, &block)
    response_bytes =  RestClient::Request.execute(:method => :post, :url => url, :payload => payload, :headers => headers, &block)
    JSON.parse(response_bytes)
end

login_url = 'https://localhost:8888/cas/api-login'
logout_url = 'https://localhost:8888/cas/api-logout'
username =  'mani'
password = 'mani'

response_json = login login_url, :username => username, :password => password
puts response_json
response = CASLoginResponse.new(response_json)
type = response.type
msg = response.msg
tgt = response.tgt
puts "CAS response type is : #{type} and msg is : #{msg} and tgt is : #{tgt}"

response_bytes =  RestClient.delete(logout_url, {:cookies => {:tgt => "#{tgt}"}})
json = JSON.parse(response_bytes)
puts json
message = json["message"]
return_msg = message["untranslated_path"]
puts return_msgcas test code
