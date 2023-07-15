-- SQL HW 1 - Sean Amato 7/14/23

-- Question 1: Which destination in the flights database is the furthest distance away?
SELECT distance, dest FROM flights WHERE distance = (SELECT MAX(distance) FROM flights); -- Answer: HNL @ 4983

-- Question 2: (Rephrased) What are the different buckets for the number of engines and for each bucket which aircraft has the most seats?
SELECT engines, max(seats) FROM planes GROUP BY engines ORDER BY engines ASC; -- This query shows the max number of seats for planes that have 1, 2, 3, and 4 engines
SELECT seats, model FROM planes WHERE seats = 16 GROUP BY model; -- This query shows the models with 1 engine and 16 seats
SELECT seats, model FROM planes WHERE seats = 400 GROUP BY model; -- This query shows the models with 2 engines and 400 seats
SELECT seats, model FROM planes WHERE seats = 379 GROUP BY model; -- This query shows the models with 3 engines and 379 seats
SELECT seats, model FROM planes WHERE seats = 450 GROUP BY model; -- This query shows the models with 4 engines and 450 seats

-- Question 3: Show the total number of flights
SELECT count(*) FROM flights; -- Answer: 857

-- Questions 4: Show the total number of flights by airline (carrier)
SELECT airlines.carrier, COUNT(flights.carrier)
FROM airlines
LEFT JOIN flights ON airlines.carrier = flights.carrier
GROUP BY airlines.carrier;

-- Question 5: Show all of the airlines, ordered by number of flights in descending order
SELECT airlines.carrier, COUNT(flights.carrier)
FROM airlines
LEFT JOIN flights ON airlines.carrier = flights.carrier
GROUP BY airlines.carrier
ORDER BY COUNT(flights.carrier) DESC;

-- Question 6: Show only the top 5 airlines, by number of flights, in descending order
SELECT carrier, count(*) FROM flights 
GROUP BY carrier 
ORDER BY count(*) DESC LIMIT 5;

-- Question 7: Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in descending order
SELECT carrier, count(*) FROM flights 
WHERE distance >= 1000 
GROUP BY carrier 
ORDER BY count(*) DESC LIMIT 5;

-- Question 8: Show the average temperature per day in the month of December and order the days from cold to hot
SELECT month, day, avg(temp) FROM weather 
WHERE month = 12
GROUP BY day
ORDER BY avg(temp) ASC;