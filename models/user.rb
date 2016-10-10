# Database and business logic
require 'pg'

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
end