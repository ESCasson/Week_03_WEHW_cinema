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

def self.select_by_id(id)
  sql = "SELECT * FROM films WHERE id = $1"
  values = [id]
  result = SqlRunner.run(sql, values)
  return Film.new(result[0])
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

def customers_by_film_count()
  result = customers_by_film.length()
end

def unique_customers_by_film_count()
  result = customers_by_film()
  result = result.map{|customer| customer.name}
  return result.uniq.length()
end

def count_tickets_by_screenings()
  sql = "SELECT screening_id, COUNT(screening_id) FROM tickets WHERE film_id = $1
  GROUP BY (screening_id) ORDER BY COUNT(screening_id) DESC LIMIT 1;"
  values = [@id]
  result = SqlRunner.run(sql, values)
  result = Ticket.new(result[0])
  screen_id = result.screening_id.to_i()
  sql2 = "SELECT * FROM screenings WHERE id = $1"
  values2 = [screen_id]
  result = SqlRunner.run(sql2, values2)
  return Screening.new(result[0]).time

end



end
