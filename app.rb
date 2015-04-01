require 'rubygems'
require 'sinatra'
require 'json'

set :port, 8080

get '/' do
  <<-EOS
  <h4>The siemplest Sinatra demo app</h4>
  EOS
  host = ENV['VCAP_APP_HOST']
  port = ENV['VCAP_APP_PORT']
  if ENV['VCAP_APPLICATION'].nil? then
    vcap_application_json = ''
    <<-EOS
       No VCAP_APPLICATION ENV variable found. Probably not running in CF
    EOS
  else
    vcap_application_json = JSON.parse(ENV['VCAP_APPLICATION'])
    application_index = vcap_application_json["instance_index"]
    vcap_application_pretty = JSON.pretty_generate(JSON.parse(ENV['VCAP_APPLICATION'])) unless ENV['VCAP_APPLICATION'].nil?
    <<-EOS
      Application Instance Index: #{application_index} <br/>
      VCAP_APPLICATION: <br/>
      #{vcap_application_pretty}
    EOS
  end
end
