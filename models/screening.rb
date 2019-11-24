require_relative('../db/sql_runner.rb')

class Screening
  attr_reader :id
  attr_accessor :time, :ticket_limit, :film_id

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @time = details['time']
    @ticket_limit = details['ticket_limit']
    @film_id = details['film_id'].to_i()
  end

  def save()
    sql = "INSERT INTO screenings (time, ticket_limit, film_id)
    VALUES ($1, $2, $3) RETURNING id"
    values = [@time, @ticket_limit, @film_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

  def select()
    sql = "SELECT * FROM screenings WHERE id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return Screening.new(result[0])
  end

end
