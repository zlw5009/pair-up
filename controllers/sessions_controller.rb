# Routes related to starting a new session, 
get "/login" do
  erb :"sessions/login", layout: :"layouts/layout"
end