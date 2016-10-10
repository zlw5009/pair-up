# Routes and helpers related to users
before do
  @storage = Users.new
end

helpers do
  def validate_password?(password, confirm)
    # pw criteria - 1 alpha char, 1 digit, 8-24
    if (password == confirm)
      return password.match(/^(?=.*[a-z])(?=.*\d).{8,24}$/)
    else
      return false
    end
  end

  def validate_user?(email, password)

  end

  def passwords_match?(password)

  end

  def current_user(email)
    @storage.user_info(email)
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
    user_info = current_user(email)

    redirect "/users/#{user_info[0][:id]}/register"
  else
    redirect '/users/signup'
  end
end

# User registration form
get '/users/:id/register' do
  @user_id = params[:id].to_i

  erb :"users/register", layout: :"layouts/layout"
end

# Update user skills
post '/users/:id/register' do
  user_id = params[:id].to_i
  ruby = params[:ruby].to_i
  sinatra = params[:sinatra].to_i
  rails = params[:rails].to_i
  sql = params[:sql].to_i
  javascript = params[:javascript].to_i
  jquery = params[:jquery].to_i
  html = params[:html].to_i
  css = params[:css].to_i
  github = params[:github].to_i
  heroku = params[:heroku].to_i

  binding.pry

  @storage.update_user_skills(user_id, ruby, sinatra, rails, sql, javascript, jquery, html, css, github, heroku)

  redirect "users/#{user_id}/dashboard"
end

get '/users/:id/dashboard' do
  erb :"users/dashboard", layout: :"layouts/layout"
end


