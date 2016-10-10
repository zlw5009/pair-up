# Routes and helpers related to users
before do
  @storage = Users.new
end

helpers do
  def passwords_match?(password, confirm)
    return password == confirm
  end

  def validate_password?(password, confirm)
    # pw criteria - 1 alpha char, 1 digit, 8-24
    if (passwords_match?(password, confirm))
      return password.match(/^(?=.*[a-z])(?=.*\d).{8,24}$/)
    else
      return false
    end
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

  if (validate_password?(password, confirm))
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


