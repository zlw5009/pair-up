require "sinatra"
require "sinatra/reloader" #if development?
require "tilt/erubis"

configure do 
  enable :sessions
  set :session_secret, "secret"
end

# Require all relatives
Dir["./models/*.rb", 
    "./views/*.rb",
    "./controllers/*.rb", 
    ].each {|file| require_relative file }

