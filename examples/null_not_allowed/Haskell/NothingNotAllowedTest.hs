intToString :: Integer -> String
intToString i = case i of
    1 -> "one"
    _ -> "not one"

main :: IO ()
main = do
    putStrLn $ intToString 1
    putStrLn $ intToString 2
