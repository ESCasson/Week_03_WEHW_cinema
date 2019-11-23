require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/ticket')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TicketTest < MiniTest::Test

  def test_create_ticket_with_film_id_and_customer_id
    ticket1 = Ticket.new({
      'film_id' => 19,
      'customer_id' => 22,
      'screening_id' => 3
      })
      assert_equal(19, ticket1.film_id)
      assert_equal(22, ticket1.customer_id)
      assert_equal(3, ticket1.screening_id)


  end

end
