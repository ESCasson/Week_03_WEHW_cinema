require('pry')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require_relative('models/screening')

Ticket.delete_all()
Screening.delete_all()
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

    screening1 = Screening.new({
      'time' => '20:00',
      'ticket_limit' => '4',
      'film_id' => film1.id
      })

    screening2 = Screening.new({
        'time' => '17:00',
        'ticket_limit' => '4',
        'film_id' => film1.id
        })

    screening3 = Screening.new({
            'time' => '18:00',
            'ticket_limit' => '4',
            'film_id' => film2.id
            })

screening1.save()
screening2.save()
screening3.save()



    ticket1 = Ticket.new({
      'screening_id' => screening1.id,
      'film_id' => screening1.film_id,
      'customer_id' => customer1.id
      })

    ticket2 = Ticket.new({
      'screening_id' => screening1.id,
        'film_id' => screening1.film_id,
        'customer_id' => customer2.id
        })

    ticket3 = Ticket.new({
      'screening_id' => screening1.id,
        'film_id' => screening1.film_id,
        'customer_id' => customer3.id
            })

    ticket4 = Ticket.new({
      'screening_id' => screening2.id,
        'film_id' => screening2.film_id,
        'customer_id' => customer2.id
      })

  ticket5 = Ticket.new({
    'screening_id' => screening3.id,
      'film_id' => screening3.film_id,
      'customer_id' => customer3.id
    })

    ticket6 = Ticket.new({
      'screening_id' => screening1.id,
        'film_id' => screening1.film_id,
        'customer_id' => customer3.id
          })



ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()

    binding.pry
    nil
