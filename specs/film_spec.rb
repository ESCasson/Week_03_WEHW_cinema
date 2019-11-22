  require('minitest/autorun')
  require('minitest/reporters')
  require_relative('../models/film')

  Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

  class FilmTest < MiniTest::Test

  def test_create_film_with_title_and_price()
    film1 = Film.new({
    'title' => 'Ice Cold in Alex',
    'price' => 8
    })
    assert_equal('Ice Cold in Alex', film1.title)
    assert_equal(8, film1.price)
  end

  end
