import Data.Char

main :: IO () 
main = do
	putStr $ "The Word-Counter 2000 \nInput your phrase \n"
	input <- getLine
	putStr $ "\nWord Analysis\n"
	putStr $ (show (wordCount input) ++ " Words \n") ++ (show (numList input) ++ " Characters" ++ "\n")   
	

type Word' = String
type Phrase = [String]

getWord :: String -> String
getWord [] = ""
getWord (x:xs) = if elem x "" then [] else x : getWord xs



characterCount :: String -> Int
characterCount xs = numList xs 
	

wordCount :: String -> Int
wordCount xs = (numList . stringToPhrase) xs 
	where
		stringToPhrase :: String -> Phrase 
		stringToPhrase [] = []
		stringToPhrase xs = getWord xs : stringToPhrase (drop (numList (getWord xs) + 1) xs)

numList :: [a] -> Int 
numList [] = 0
numList (x:xs) = 1 + numList xs


