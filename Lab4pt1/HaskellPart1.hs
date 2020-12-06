import Data.List --importing 2 modules
import System.IO

 --Problem 3 function to tell if n * 3 + 1 is even or not-------------
isEven :: Int -> Bool 
isEven n
    | (n * 3 + 1) `mod` 2 == 0 = True
    | otherwise = False
    



--problem 12 make List function-------------
makeList :: Int -> [[Int]]
makeList n = [ [1..x] | x <- [1..n] ]



--problem number 15 getSuit function-------------
getSuit :: Int -> String

getSuit 0 =  "Heart"
getSuit 1 = "Diamond"
getSuit 2 = "Spade"
getSuit 3 = "Club"
getSuit _ = "error"


--problem number 16 dotProduct function-------------
dotProduct :: (Double,Double,Double) -> (Double,Double,Double) -> Double
dotProduct (x1, x2, x3) (y1, y2, y3) =  foldl (+) 1([x1 * y1, x2 * y2, x3 *y3])


--problem number 17 reverseFristThree function-------------
reverseFirstThree :: [Int] -> [Int]
reverseFirstThree xs
    | length xs < 2 = xs
    | length xs == 2 =reverse xs
reverseFirstThree(x:y:z:xs) = take 3 (z: y: x: reverseFirstThree xs)



--problem number 18 feelsLike function-------------
--will tell how warm or cold it feels like outside given a temperature in Fahrenheit
feelsLike :: Double -> String 
feelsLike n
    | n < 0 = "frostbite central :/"
    | n < 65 = "too cold!!"
    | n < 85 = "perfect!!"
    | otherwise = "too hot!!"
    
    
--problem number 19 feelsLike2 function-------------
--will tell how warm or cold it feels like outside given a temperature and convert to fahrenheight
feelsLike2 :: Double -> (String, Double) 
feelsLike2 n
    | n < 0 = ("frostbite central :/", (n *1.8 + 32))
    | n < 65 = ("too cold!!", (n *1.8 + 32))
    | n < 85 = ("perfect!!", (n *1.8 + 32))
    | otherwise = ("too hot!!", (n *1.8 + 32))

--problem number 20 cylinderToVolume function-------------
cylinderToVolume :: [(Double,Double)] -> [Double]
cylinderToVolume [] = []
cylinderToVolume (x:xs) =
    let volume = ( pi * (fst x * fst x) * snd x) 
    in  volume : cylinderToVolume xs
    



--Lab4 Assignment------------------------------------

main = do
   
        putStrLn "---------------------------1-----------------------------"
        print(sqrt (fromIntegral 818281336460929553769504384519009121840452831049))
        --this is the square root of "818281336460929553769504384519009121840452831049"
    
        putStrLn "---------------------------2----------------------------"
        print(fromEnum 'A')
        --ASCII value for uppercase "A" is "65"
    
        print(toEnum 64 :: Char)
        --ASCII character before 65 is "@"
    
        putStrLn "---------------------------3----------------------------"
        print(isEven (10))
        print(isEven (121))
        print(isEven (11))
        --function to return True if 3 * n + 1 is even otherwise return false
        
        putStrLn "---------------------------4----------------------------"
        print( product [1,3..100])
        --the product of all odd numbers from 1 - 100
        
        putStrLn "---------------------------5----------------------------"
        let question5List = [99,23,4,2,67,82,49,4-0] 
        print(maximum (drop 1(init question5List)))
        --used maxinmum drop and init to find the largest value that isn't the first or last number
        
        putStrLn "---------------------------6----------------------------"
        let question6List = 6 : 19 : 41 : -3 :[]
        print(question6List)
        --constructed list using cons operator and the empty list.
        
        putStrLn "---------------------------7----------------------------"
        print( take 27 ([x | x <- [0..], even x]))
        --used take, list comprehension, and even function to get the first 27 even numbers,
        --was also lazy about it
        
        putStrLn "---------------------------8----------------------------"
        print ( [x | x <- [1,3..199], x `mod` 3 == 0, x `mod` 7 == 0 ] )
        --list of all odd numbers less than 200 that are divisible by 3 and 7.
        
        putStrLn "---------------------------9----------------------------"
        print ( length ([x | x <- [100..200], x `mod` 9 == 0]))
        --used length and list comprehension to count how many numbers 
        --from 100-200 are divisible by 9
        
        putStrLn "---------------------------10----------------------------"
        let inputList = [-4, 6, 7, 8, -14]
        print ( length ([x | x <- inputList, x < 0]))
        --used list compregension to construct a list from the input list
        --with nonnegative numbers filtered out. There are 2 negative numbers 
        --in theinput list
        
        putStrLn "---------------------------11----------------------------"
        let numberValues = ['0'..'9'] 
        let hexValues = numberValues ++ ['A'..'F']
        let intValues = [0..15]
        print(zip intValues hexValues)
        --created 2 lists and zipped them together to create a list of Hexadecimal mappings

        putStrLn "---------------------------12----------------------------"
        print(makeList 5)
        --used my makeList function to generate a list of lists each increasing by 1 from 1 - n
        
        putStrLn "---------------------------13----------------------------"
        let sanitize = concatMap (\c -> if c==' ' then "%20" else [c])
        print(sanitize "http://wou.edu/my homepage/I love spaces.html")
        --function sanitize replaces all spaces in the string with "%20"
        
        putStrLn "---------------------------14----------------------------"
        
        --(*) :: Num a => a -> a -> a
        --works with Ints, Integers
        
        --(min) :: Ord a => a -> a -> a
        --works with Ints, Integers
        
        --(length) :: Foldable t => t a -> Int
        --works with [Ints], Integers
        
        --(>) :: Ord a => a -> a -> Bool
        --works with Float, Double
        
        --(succ) :: Enum a => a -> a
        --works with Ints, Integers, Float, Double
        
        putStrLn "---------------------------15----------------------------"
        print(getSuit 0)
        print(getSuit 1)
        print(getSuit 2)
        print(getSuit 3)
        print(getSuit 4)
        
        putStrLn "---------------------------16----------------------------"
        print(dotProduct (2,2,3)(5,5,6))
        --returns the dot product of the 2 tuples
        
        putStrLn "---------------------------17----------------------------"
        print(reverseFirstThree [2,3])
        print(reverseFirstThree [2])
        print(reverseFirstThree [])
        print(reverseFirstThree [21,3,4,5,3,2,4,6,7])
        --if list has length less then 2 then print list, if list is length 2
        --then reverse 2 numbers, length bigger then 2 then reverse first three of list
        
        putStrLn "---------------------------18----------------------------"
        print(feelsLike (-2))
        print(feelsLike 14)
        print(feelsLike 75)
        print(feelsLike 90)
        --function that will tell how warm or cold it feels like outside given a temperature in Fahrenheit
        
        
        putStrLn "---------------------------19----------------------------"
        print(feelsLike2 (-2))
        print(feelsLike2 20)
        print(feelsLike2 75)
        print(feelsLike2 90)
        --almost the same as feelsLike function except converts celsius value to Fahrenheight and 
        --returns a (String, Double)tuple
        
        putStrLn "---------------------------20----------------------------"
        print(cylinderToVolume [(5,2), (5,4), (10,5), (13,2), (17,4),(2,5.3)])
        --a function that uses "let" and returns a list of volumes derived from a list of cylinder radii and heights