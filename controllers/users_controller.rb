# Routes and helpers related to users

# New user form
get '/users/register' do
  erb :"users/register", layout: :"layouts/layout"
end

get '/users/:id/dashboard' do
  erb :"users/dashboard", layout: :"layouts/layout"
end

get '/users/1/dashboard' do
  erb :"users/dashboard", layout: :"layouts/layout"
end

post '/users/create' do; end