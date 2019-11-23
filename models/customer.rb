require_relative('../db/sql_runner.rb')

class Customer

attr_reader :id
attr_accessor :name, :funds

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @name = details['name']
    @funds = details['funds'].to_f()
  end

def save()
 sql = "INSERT INTO customers (name, funds)
 VALUES ($1, $2) RETURNING id;"
 values = [@name, @funds]
 result = SqlRunner.run(sql,values)
 @id = result[0]['id'].to_i()
end

def self.delete_all()
  sql = "DELETE FROM customers"
  SqlRunner.run(sql)
end

def select()
  sql = "SELECT * FROM customers WHERE id = $1"
  values = [@id]
  result = SqlRunner.run(sql, values)
  return Customer.new(result[0])
end

def self.select_all()
  sql = "SELECT * FROM customers"
  result = SqlRunner.run(sql)
  return result.map{|customer| Customer.new(customer)}
end

def update(new_name, new_funds)
  sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
  values = [new_name, new_funds, @id]
  SqlRunner.run(sql, values)
end

def delete()
  sql = "DELETE FROM customers WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def films_by_customer()
  sql = "SELECT films.* FROM films
  INNER JOIN tickets ON films.id = film_id
  WHERE customer_id = $1"
  values =[@id]
  result = SqlRunner.run(sql, values)
  return result.map{|film| Film.new(film)}
end

def reduce_funds(amount)
  new_funds = @funds - amount
  update(@name, new_funds)
end

end
