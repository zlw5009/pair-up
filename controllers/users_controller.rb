# Routes and helpers related to users
before do
  @storage = Users.new
end

helpers do
  def passwords_match?(password, confirm)
    return password == confirm
  end
end

# New user form
get '/users/signup' do
  erb :"users/signup", layout: :"layouts/layout"
end

# create new user
post '/users/signup' do
  name = params[:name]
  email = params[:email]
  password = params[:password]
  confirm = params[:confirm_password]

  if (passwords_match?(password, confirm))
    @storage.new_user(name, email, password)
    redirect '/users/register'
  else
    redirect '/users/signup'
  end
end

get '/users/register' do
  erb :"users/register", layout: :"layouts/layout"
end

get '/users/:id/dashboard' do
  erb :"users/dashboard", layout: :"layouts/layout"
end


