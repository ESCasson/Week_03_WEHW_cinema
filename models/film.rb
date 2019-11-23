require_relative('../db/sql_runner.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @title = details['title']
    @price = details['price'].to_f()
end

def save()
  sql = "INSERT INTO films (title, price)
  VALUES ($1, $2) RETURNING id;"
  values = [@title, @price]
  result = SqlRunner.run(sql, values)
  @id = result[0]['id'].to_i()
end

def self.delete_all()
  sql = "DELETE FROM films"
  SqlRunner.run(sql)
end

def select()
  sql = "SELECT * FROM customers WHERE id = $1"
  values = [@id]
  result = SqlRunner.run(sql)
  return Film.new(result[0])
end

def self.select_all()
  sql = "SELECT * FROM films"
  result = SqlRunner.run(sql)
  return result.map{|film| Film.new(film)}
end

def update(new_title, new_price)
  sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
  values = [new_title, new_price, @id]
  SqlRunner.run(sql, values)
end

def delete()
  sql = "DELETE FROM films WHERE ID = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def customers_by_film()
  sql = "SELECT customers.* FROM customers
  INNER JOIN tickets ON customers.id = customer_id
  WHERE film_id = $1"
  values =[@id]
  result = SqlRunner.run(sql, values)
  return result.map{|customer| Customer.new(customer)}

end


end
