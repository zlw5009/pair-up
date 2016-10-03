# For general purpose/common controller logic
get "/" do 
  erb :"sessions/splash", layout: :"layouts/layout"
end