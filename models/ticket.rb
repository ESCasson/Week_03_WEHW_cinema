#require_relative('../db/sqlrunner.rb')
class Ticket

  attr_reader :id
  attr_accessor :film_id, :customer_id

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @film_id = details['film_id']
    @customer_id = details['customer_id'].to_f()
  end

end
