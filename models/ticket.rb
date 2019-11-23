require_relative('../db/sql_runner.rb')
class Ticket

  attr_reader :id
  attr_accessor :film_id, :customer_id

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @film_id = details['film_id'].to_i()
    @customer_id = details['customer_id'].to_i()
  end

  def save()
    sql = "INSERT INTO tickets (film_id, customer_id)
    VALUES ($1, $2) RETURNING id;"
    values = [@film_id, @customer_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()

  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

def select()
  sql = "SELECT * FROM tickets WHERE id = $1"
  values = [@id]
  result = SqlRunner.run(sql, values)
  return Ticket.new(result[0])
end

def self.select_all()
  sql = "SELECT * FROM tickets"
  result = SqlRunner.run(sql)
  return result.map{|ticket| Ticket.new(ticket)}
end

def update(new_title_id, new_customer_id)
  sql = "UPDATE tickets SET (film_id, customer_id) =
  ($1, $2) WHERE id = $3"
  values = [new_title_id, new_customer_id, @id]
  SqlRunner.run(sql, values)
end

def delete()
  sql = "DELETE FROM tickets WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end


def customer_buys_ticket()
  customer = Customer.select_by_id(@customer_id)
  film = Film.select_by_id(@film_id)
  amount = film.price()
  customer.reduce_funds(amount)
end


end
