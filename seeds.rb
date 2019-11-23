require('pry')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({
  'name' => 'Sarah',
  'funds' => 50.00
})

customer2 = Customer.new({
  'name' => 'Gillian',
  'funds' => 60.00
  })

customer3 = Customer.new({
    'name' => 'Phil',
    'funds' => 30.00
    })

    customer1.save()
    customer2.save()
    customer3.save()

    film1 = Film.new({
    'title' => 'Ice Cold in Alex',
    'price' => 8.0
    })

    film2 = Film.new({
      'title' => 'The Rear Window',
      'price' => 4.0
      })

    film3 = Film.new ({
      'title' => 'the Holiday',
      'price' => 7.0
        })

    film1.save()
    film2.save()
    film3.save()

    ticket1 = Ticket.new({
      'film_id' => film1.id,
      'customer_id' => customer1.id
      })
    ticket2 = Ticket.new({
        'film_id' => film1.id,
        'customer_id' => customer2.id
        })
ticket1.save()
ticket2.save()

    binding.pry
    nil
