module Assn2b (myLength, convertIntToStringLeft, convertIntToStringRight, cycleOfTen, lengthWithFuncApp) 
    where
    import Data.Char
    myLength :: [a] -> Int
    myLength = foldr (\_ n -> 1 + n) 0
    
    convertIntToStringLeft :: [Int] -> [Char]
    convertIntToStringLeft x =foldl (\acc x -> acc ++ [intToDigit x]) [] x
    
    convertIntToStringRight :: [Int] -> [Char]
    convertIntToStringRight x =foldr (\x xs->intToDigit x : xs) [] x
    
    --Problem number 4 rewrote function to use $ operator
    cycleOfTen = (take 10 $ cycle $ filter (>5) $ map (*2) [1..10])
    
    
    --Problem number 4 rewrote function to use $ operator
    lengthWithFuncApp = length $ filter (<20) [1..100]
