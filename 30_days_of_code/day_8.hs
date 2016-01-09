import Data.Map as Map
import Data.Maybe as Maybe
import Data.List as List
import System.IO

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (x:xs)    
        return ret

getMultiplePhones :: Int -> IO [(String, String)]
getMultiplePhones n
    | n <= 0 = return []
    | otherwise = do          
        name <- getLine
        phone_number <- getLine
        xs <- getMultiplePhones (n-1)        
        return ((name, phone_number):xs)

getPhones :: Map String String -> [String] -> [String]
getPhones _ [] = []
getPhones map_phones (name:names) = 
		(Maybe.fromMaybe "Not found" (Map.lookup name map_phones)):getPhones map_phones names

getNames :: [String] -> [String] -> [String]
getNames _ [] = []
getNames (name:names) (phone:phones) = 
	if phone == "Not found" then
		"Not found":getNames names phones
	else
		(name ++ "=" ++ phone):getNames names phones

main :: IO ()
main = do
    n <- getLine
    map_phones <- getMultiplePhones (read n :: Int)
    let phone_map = (Map.fromList map_phones)
    names <- getMultipleLines (read n :: Int)
    putStrLn (List.intercalate "\n" (getNames names (getPhones phone_map names)))