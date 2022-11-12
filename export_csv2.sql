COPY (
    select rental.rental_id,
           rental.rental_date,
           rental.return_date,
           inventory.film_id,
           payment.amount
    from rental
             left join inventory on inventory.inventory_id = rental.inventory_id
             left join payment on payment.rental_id = rental.rental_id
    ) TO '/tmp/customer_rentals.csv' WITH CSV header;
