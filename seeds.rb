require('pry')
require_relative('models/customer')

Customer.delete_all()

customer1 = Customer.new({
  'name' => 'Sarah',
  'funds' => 50
})

customer2 = Customer.new({
  'name' => 'Gillian',
  'funds' => 60
  })

customer3 = Customer.new({
    'name' => 'Phil',
    'funds' => 30
    })

    customer1.save()
    customer2.save()
    customer3.save()







    binding.pry
    nil
