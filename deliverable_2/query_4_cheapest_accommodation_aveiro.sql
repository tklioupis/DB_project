SELECT accommodation.price, accommodation.street, accommodation.website
FROM accommodation
WHERE accommodation.city = "Aveiro" AND accommodation.listing_id NOT IN( 
SELECT accommodation.listing_id 
FROM accommodation CROSS JOIN accommodation AS A
WHERE accommodation.city = "Aveiro" AND A.city = "Aveiro" AND  accommodation.price> A.price 
)
    