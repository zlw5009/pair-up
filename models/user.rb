# Database and business logic
require 'pg'
require 'pry'

class Users
  def initialize
    @db = PG.connect(dbname: "pairup")
  end

  def query(statement, *params)
    @db.exec_params(statement, params)
  end

  def new_user(name, email, password)
    sql = "INSERT INTO users (name, email, password) VALUES ($1, $2, $3);"

    query(sql, name, email, password)
  end

  def user_info(email)
    sql = "SELECT * FROM users WHERE email = $1"

    result = query(sql, email)

    result.map { |tuple| user_info_tuple_to_hash(tuple) }
  end

  def update_user_skills(user_id, ruby, sinatra, rails, sql, javascript, jquery, html, css, github, heroku)
    sql = <<~SQL
      INSERT INTO skillset (ruby, sinatra, rails, sql, javascript,
        jquery, html, css, github, heroku, user_id) 
      VALUES (#{ruby}, #{sinatra}, #{rails}, #{sql}, #{javascript},
        #{jquery}, #{html}, #{css}, #{github}, #{heroku}, #{user_id});
    SQL

    query(sql)
  end

  private

  def user_info_tuple_to_hash(tuple)
    {id: tuple["id"].to_i,
     name: tuple["name"],
     email: tuple["email"],
     password: tuple["password"],
     current_team_id: tuple["current_team_id"].to_i,
     current_challenge_id: tuple["current_challenge_id"].to_i}  
  end
end