# Routes and helpers for the projects resource
get "/projects/upcoming" do
  erb :"projects/show", layout: :"layouts/layout"
end

get "projects/current" do 
  erb :"projects/show", layout: :"layouts/layout"
end

get "projects/index" do
  erb :"projects/index", layout: :"layouts/layout"
end

# Admin project creation page
get "projects/new" do; end 
