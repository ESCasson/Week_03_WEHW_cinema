require('pry')
require_relative('models/customer')
require_relative('models/film')

Customer.delete_all()
Film.delete_all()

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

    film1 = Film.new({
    'title' => 'Ice Cold in Alex',
    'price' => 8
    })

    film2 = Film.new({
      'title' => 'The Rear Window',
      'price' => 4
      })

    film3 = Film.new ({
      'title' => 'the Holiday',
      'price' => 7
        })

    film1.save()
    film2.save()
    film3.save()



    binding.pry
    nil
