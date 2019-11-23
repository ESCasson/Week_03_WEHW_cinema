require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/screening')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class ScreeningTest < MiniTest::Test

  def test_create_a_screening_with_time_and_film_id_and_ticket_limit
    screening1 = Screening.new({
      'time' => '20:00',
      'film_id' => 1,
      'ticket_limit' => 4
      })
assert_equal('20:00', screening1.time)
assert_equal(1, screening1.film_id)
assert_equal(4, screening1.ticket_limit)
    end


end
