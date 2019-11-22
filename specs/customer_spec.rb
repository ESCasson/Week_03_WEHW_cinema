require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/customer')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class CustomerTest < MiniTest::Test

def test_create_customer_with_name_and_funds
  customer1 = {
    'name' => 'Sarah',
    'funds' => 50,
  }
customer_sarah = Customer.new(customer1)

assert_equal('Sarah', customer_sarah.name)
assert_equal(50, customer_sarah.funds)
end

end
