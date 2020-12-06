import Data.List --importing 2 modules
import System.IO
import Assn2b


 --problem number 1 gcdMine/gcdCheck function-------------
gcdMine :: Integral a => a -> a -> a
gcdMine x 0 = x
gcdMine x y = gcdMine y (x `mod` y)
    
gcdCheck x y = (myAnswer, correctAnswer, comment)
       where
       myAnswer = gcdMine x y
       correctAnswer = gcd x y
       comment = if myAnswer == correctAnswer
                   then "Matches"
                   else "Does Not Match"


 --problem number 2 fibonacci function-------------
 
fibonacci :: Int -> Int
fibonacci n
    | n == 0 = 0
    | n==1 = 1
    | otherwise = ((fibonacci (n-1)) + (fibonacci (n-2)))
    

--problem number 3 count function-------------   
count :: (Eq a, Num b) => a -> [a] -> b
count x [ ] = 0
count x (y:ys)
    | x == y = 1 + count x ys
    | otherwise = count x ys

--problem number 4 recursive sanitize function-------------
sanitize :: String -> String
sanitize "" = []
sanitize (' ':xs) = "%20" ++ sanitize xs
sanitize (x:xs) = x:sanitize xs


--problem 13-18 lambda functions------------
plus = \x y -> x + y 

--or just (\x y -> x + y) 4 5
    
    
--problem 15 list for lambda function to return second item----------
aList = [1,3..15]


--problem 17 function for turning a string to a list of words using lambda functions------------

pythagoreanTheorem = map (\(a,b) -> (a,b,( sqrt $ a**2 + b**2)))





--Haskell Assignment 2------------------------------------

main = do
   
        putStrLn "---------------------------1-----------------------------"
        
        print(gcdMine 111 259) 
        print(gcdCheck 111 259)
        print(gcdMine 2945 123042) 
        print(gcdCheck 2945 123042)
        print(gcdMine  (2*5*7)(7*23)) 
        print(gcdCheck (2*5*7)(7*23)) 
        --Implement the greatest common divisor algorithm 
        --include gcdCheck below in your code
        
        putStrLn "---------------------------2----------------------------"
        
        print([fibonacci n | n <- [0..20]])
        --function to compute Fibonacci numbers
     
        putStrLn "---------------------------3----------------------------"
        
        print(count 7 [1,7,6,2,7,7,9])
        print( count 'w' "western oregon wolves" )
        --function that counts how many items are found in a list that match the one given
        
        putStrLn "---------------------------4----------------------------"
        
        print(sanitize "http://wou.edu/my homepage/I love spaces.html")
        --Rewrite sanitize function using recursion
        
        putStrLn "---------------------------5----------------------------"
        print(map (*10) [0,2..100])       
        --Multiply every element of a list by 10
        
        putStrLn "---------------------------6----------------------------"
        print(map (+1) [0,2..100])
        --Increment every element in a list.
        
        print(map succ "Hello")
        -- Write it again so that it can increment things like "Hello" into "Ifmmp" 
        
        
        putStrLn "---------------------------7----------------------------"
        
        print(any (\x -> x `mod`42 == 0) [1,2,3,4,5,6])
        print(any (\x -> x `mod`42 == 0) [1,2,3,4,5,126])
        --Tell you True or False whether or not a list contains a value that is divisible by 42
        
        putStrLn "---------------------------8----------------------------"
       
        
        print(zipWith (\x y -> y**x)[5,3,8,2,3,6,3] [10, 10..])
        --takes list and raises 10 to the power of the element in list
        
        putStrLn "---------------------------9----------------------------"
     
        print(dropWhileEnd (==' ')  "foo   ")
        --Remove all spaces from the end of a string (often called stripping a string).
        
        putStrLn "---------------------------10----------------------------"
      
        print(all even [2,4,6,8,10,44,32,224])
        print(all even [2,4,6,8,10,44,32,224,23])
        --Tell you True or False if a list contains nothing but even numbers
        
        putStrLn "---------------------------11----------------------------"
        
        print(map ("not " ++)  ["Funny","cold","slow"] )
        --Put the word "not" on the front of all strings in a list
        
        putStrLn "---------------------------12----------------------------"
        
        print(map (reverse) ["This","is","a","sentence"])
        --Reverse all strings contained in a list
   
        putStrLn "---------------------------13----------------------------"
        
        print(plus 4 5)
        
        print((\x y -> x + y) 4 5)
        --plus x y = x + y as lambda function
        
        putStrLn "---------------------------14----------------------------"
        
        print((\x -> x*4) 4)
        --(*4)
        
        putStrLn "---------------------------15----------------------------"
       
        print((\x -> drop 1 (take 2 x)) [1,5..100])
        print((\x -> drop 1 (take 2 x)) aList)
        --A function that gives you the second element in a list
       
        putStrLn "---------------------------16----------------------------"
     
        print((\x-> round (sqrt (fromIntegral x)) :: Int ) 27) 
        -- A function that takes the square root of a number and then rounds it.

        
        putStrLn "---------------------------17----------------------------"
      
        print((\xs -> words(xs)) "This is a sentence written in the usual way.")
        
        --convert a sring to a list of its words
        putStrLn "---------------------------18----------------------------"
      
      
        print(pythagoreanTheorem [(3,4),(5,16),(9.4,2)])
        --lambda function that takes a 2-tuple and  returns 3 tuple with the side c added
        
        
        
        --Haskell Assignment 2 part 2 :Higher-order Functions II & Modules------------
        
        --foldl (*) 6 [5,3,8]
        --(foldr (*) 6 [5,3]) * 8 -->
        --(foldr (*) 6 [5]) * 3) * 8 -->
        --(foldr (*) 6 []) * 5) * 3) * 8 -->
        --((6 * 5) * 3) * 8 -->
        --(30 * 3) * 8 -->
        --90 * 8 -->
        --720
        
        
        
        --foldr (*) 6 [5,3,8]
        --5 * (foldr (*) 6 [3,8]) -->
        --5 * (3 * (foldr (*) 6 [8])) -->
        --5 * (3 * (8 *(foldr (*) 6 []))) -->
        --5 * (3 * (8 * 6)) -->
        --5 * (3 * 48) -->
        --5 * (144) -->
        --720
      
        
        
        putStrLn "---------------------------2----------------------------"
       
        print(myLength [2,2,3,5,5,2,1,2,2,2,5,2,5] )
       
        putStrLn "---------------------------3----------------------------"
        
        print(convertIntToStringLeft [2,2,2,2,3,4,4,5])
        print(convertIntToStringRight [2,2,2,2,3,4,4,5])
        --create convertIntToString function the uses foldr and foldl the mimics map intToDigit [5,2,8,3,4] == "52834"

        
        putStrLn "---------------------------4----------------------------"
        
        print(cycleOfTen)
        print(lengthWithFuncApp)
        --rewrote functions using function app operator
        
        