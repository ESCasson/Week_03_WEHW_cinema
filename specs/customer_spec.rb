require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/customer')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class CustomerTest < MiniTest::Test

def test_create_customer_with_name_and_funds
  customer1 = Customer.new({
    'name' => 'Sarah',
    'funds' => 50,
  })


assert_equal('Sarah', customer1.name)
assert_equal(50, customer1.funds)
end

end
