module Main where

main :: IO ()
main = do
 	putStr "The Word-Counter 2000 \nInput your phrase \n"
	input <- getLine
	putStr $ "\nWord Analysis\n"
	putStr $ (show (wordCount input) ++ " Words \n") ++ (show (numList input) ++ " Characters" ++ "\n")


type Phrase = [String]


wordCount :: String -> Int
wordCount = numList . stringToPhrase
	where
		stringToPhrase :: String -> Phrase
		stringToPhrase [] = []
		stringToPhrase xs = getWord xs : stringToPhrase (drop (numList (getWord xs) + 1) xs)

getWord :: String -> String
getWord [] = ""
getWord (x:xs) = if x `elem` " " then [] else x : getWord xs


numList :: [a] -> Int
numList xs = foldr (\ x -> (+) 1) 0 xs
