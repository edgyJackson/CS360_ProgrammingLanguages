{-      Lab 4: Reggie Johnson-}




--Problem #1------------------------------------------------------------------------------------------------|
--Litres to gallons woopty woo

gallons :: Fractional a => a -> a
gallons x = x * 0.26


--  CAD to USD incase you need it; I aint mad at ya

usd :: Fractional a => a -> a
usd x = x * 0.74

--price per gallon in Us units given CAD units. Enter CAD/Liter amount  
price :: Fractional a => a-> a -> a
price x y = (usd x)/( gallons y)


problemOneAnswer = price 78.4 62.3
{- Answer: $3.58 per gallon -}












--Problem #2 Flight distance to compute appx distance ------------------------------------------------------|
--between two locations on earth 

--rad function takes a tuple of floats and converts them from degrees to radians
radFuncion :: (RealFloat a) => (a, a) -> (a, a)
radFuncion (x, y) = ((x*pi)/180, (y*pi)/180)



flightDistance :: (RealFloat a) => (a, a) -> (a, a) -> a
flightDistance (x1, y1) (x2, y2) = 3963.0 * acos((cos dx1 * cos dx2 * cos(dy1 - dy2)) + (sin dx1 * sin dx2))
    where (dx1, dy1) = radFuncion (x1, y1)
          (dx2, dy2) = radFuncion (x2, y2)


problemTwoAnswer = flightDistance (45,122) (21,158)
{- Answr: 2632 nautical miless-}













--Problem #3 list comprehension and the sum function to ----------------------------------------------------|
--determine the sum of the cubes of all the
--odd numbers between 1000 and 2000?
problemThreeAnswer = sum [xs | xs <- map (^3) [1001, 1003..2000]]















--Problem #4 using map, filter, any or all to--------------------------------------------------------------|
-- remove all spaces from a string
removeSpaces xs = filter (/= ' ') xs

-- filter out all even numbers from a list (use the even function)
removeEvens xs = filter odd xs

-- double every value in a list
doubleUpList xs = map (*2) xs

-- tell you True or False if a list contains the number 55
contains55 xs = any (== 55) xs

-- tell you True or False if all the values in a list are odd (use the odd function)
isOddList xs = all odd xs

{- ANSWER: N/A -}






--Problem #5 isPrime that determines if an Integer is a prime number--------------------------------------|

--first find all fractors of number and then see if list of factors contain on 1 and n
factors n = [x | x <- [1..n], mod n x == 0]
isPrime n = factors n == [1,n]



--1000th through 1020th prime numbers? (starting at 2)

myPrimeNumbers = [ x | x <- [1000..1020 ], isPrime x ]


--generate 100th prime number to 1020th prime numbers
generatePrimes :: Integral a => Int -> [a]
generatePrimes n = drop 999 (take n [i | i <- [1..], isPrime i])

problemFiveAnswer = generatePrimes 1020

{- ANSWER: -}









--Problem #6 determine its prime factors (called prime factorization)--------------------------------------|

primeFactors :: Integer -> [Integer]
primeFactors n = removeMultiples (factorHelper n)


--  helper function
factorHelper :: Integer -> [Integer]
factorHelper n 
    | n == 1 = []
    | otherwise = let x = head $ dropWhile ((/= 0) . mod n) [2..n]
                  in (x :) $ primeFactors $ div n x
-- used code found at: https://wiki.haskell.org/99_questions/Solutions/35




-- get rid of duplacates in a list 
removeMultiples :: Eq a => [a] -> [a]
removeMultiples [] = []
removeMultiples (x:xs)
    | x`elem` xs = removeMultiples xs
    | otherwise = x : removeMultiples xs



{- ANSWER: [419] and  [2,5,11,13,23,47,101] -}




--Problem #7  main function that prints all of your function outputs--------------------------------------|
--Lab 4 Haskell------------------------------------

main = do
   
        putStrLn "\n\n\n---------------------------1  62.3 liters of fuel and paid 78.4 Canadian dollars. What price is that in US dollars per gallon?-----------------------------\n\n\n"
        print(show problemOneAnswer ++ " Dollars/Gallon" ) 
        
        
        
        
        putStrLn "\n\n\n---------------------------2  flight distance between the point at 45N,122W to the point 21N,158W?-----------------------------\n\n\n"
        print(show problemTwoAnswer ++ " nautical miles")
        
        
        
        
        
        putStrLn "\n\n\n---------------------------3  determine the sum of the cubes of all the odd numbers between 1000 and 2000?-----------------------------\n\n\n"
        print(problemThreeAnswer)
        
        
        
        
        
        putStrLn "\n\n\n---------------------------4  expressions using map, filter, any, or all-----------------------------\n\n\n"
        
        putStrLn "-- remove all spaces from a string example : 'I love to remove spaces' "
        print(removeSpaces "I love to remove spaces")

        putStrLn "\n-- filter out all even numbers from a list (use the even function) example: [1..100]  "
        print(removeEvens [1..100])

        putStrLn "\n-- double every value in a list example : [1..25]"
        print(doubleUpList [1..25])

        putStrLn "\n-- tell you True or False if a list contains the number 55 2 examples : [1..54] and [1, 55, 56, 65, 77, 54] "
   
        print(contains55 [1..54] )
        print(contains55 [1, 55, 56, 65, 77, 54] )
        putStrLn "\n-- tell you True or False if all the values in a list are odd (use the odd function) 2 examples : [1,3,5,7,21,35,37] and [1,3,5,7,21,32,37]"
        print(isOddList [1,3,5,7,21,35,37] )
        print(isOddList [1,3,5,7,21,32,37] )
        
        
        
        putStrLn "\n\n\n---------------------------5 determines if an Integer is a prime number-----------------------------"
        putStrLn "---------------------------5 1000th through 1020th prime numbers? (starting at 2)-----------------------------\n\n\n"
        
        print(problemFiveAnswer)
        
        
        putStrLn "\n\n\n---------------------------6 What are the prime factors of 175561 and 62451532000?-----------------------------\n\n"
        
        putStrLn "------ 175561 -----------"
        print(primeFactors 175561)
        
        putStrLn "\n------ 62451532000 -----------"
        print(primeFactors 62451532000)
    
        putStrLn "\n\n\n"


















