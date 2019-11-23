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

end
