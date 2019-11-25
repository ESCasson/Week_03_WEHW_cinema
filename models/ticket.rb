require_relative('../db/sql_runner.rb')
class Ticket

  attr_reader :id
  attr_accessor :film_id, :customer_id, :screening_id

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @screening_id = details['screening_id']
    @film_id = details['film_id'].to_i()
    @customer_id = details['customer_id'].to_i()
  end

  def save()
    sql = "INSERT INTO tickets (screening_id, film_id, customer_id)
    VALUES ($1, $2, $3) RETURNING id;"
    values = [@screening_id, @film_id, @customer_id]
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

def update(new_screening_id, new_title_id, new_customer_id)
  sql = "UPDATE tickets SET (screening_id, film_id, customer_id) =
  ($1, $2, $3) WHERE id = $4"
  values = [new_screening_id, new_title_id, new_customer_id, @id]
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

def count_tickets_by_screening()
  sql = "SELECT COUNT(screening_id) FROM tickets
  WHERE screening_id = $1"
  values = [@screening_id]
  result = SqlRunner.run(sql, values)
  result = result[0]
  return result["count"].to_i()
end

def screening_limit()
  sql = "SELECT ticket_limit FROM screenings WHERE id = $1"
  values = [@screening_id]
  result = result = SqlRunner.run(sql, values)
  result = result[0]
  return result["ticket_limit"].to_i()
end

def checks_space_in_screening
  if count_tickets_by_screening() < screening_limit()
    return "You can buy a ticket"
  else
    return "Screening is full"
  end
end


end
