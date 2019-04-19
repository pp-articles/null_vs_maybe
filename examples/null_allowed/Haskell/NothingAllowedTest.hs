import Data.Maybe (fromMaybe)

intToString :: Maybe Integer -> Maybe String
intToString i = case i of
    Just 1 -> Just "one"
    Nothing -> Nothing
    _ -> Just "not one"
    
intToStringWrong :: Maybe Integer -> Maybe String
intToStringWrong i = case i of
    Just 1 -> Just "one"
    _ -> Just "not one"

displayResult :: Maybe String -> IO()
displayResult s = 
    putStrLn $ "Result: " ++ fromMaybe "null" s

main :: IO ()
main = do
    displayResult $ intToString (Just 1)
    displayResult $ intToString (Just 2)
    displayResult $ intToString (Nothing)
    
    -- displayResult $ intToStringWrong (Just 1)
    -- displayResult $ intToStringWrong (Just 2)
    -- displayResult $ intToStringWrong (Nothing)

    -- print $ length "foo"
    -- print $ length $ Just "foo"
