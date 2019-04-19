import Control.Monad (mplus)
import Data.Maybe (fromMaybe)
import Control.Applicative
import Text.Printf

discountFromNet :: String -> Maybe Float
discountFromNet customerID = if customerID == "Net" then Just 10.0 else Nothing

discountFromDB :: String -> Maybe Float
discountFromDB customerID = if customerID == "DB" then Just 7.0 else Nothing

discountFromCache :: String -> Maybe Float
discountFromCache customerID = if customerID == "Cache" then Just 5.0 else Nothing

customerDiscount :: String -> Float
customerDiscount customerID =
    let discountMaybe = discountFromNet customerID
                        <|> discountFromDB customerID
                        <|> discountFromCache customerID
    in fromMaybe 0.0 discountMaybe

-- some alternatives:

customerDiscount2 :: String -> Float
customerDiscount2 customerID =
    let discountMaybe = discountFromNet customerID
                        `mplus` discountFromDB customerID
                        `mplus` discountFromCache customerID
    in fromMaybe 0.0 discountMaybe

customerDiscount3 :: String -> Float
customerDiscount3 customerID =
    fromMaybe 0.0 $ discountFromNet customerID
        <|> discountFromDB customerID
        <|> discountFromCache customerID

customerDiscount4 :: String -> Float
customerDiscount4 customerID =
    case (discountFromNet customerID) of
    Just d -> d
    Nothing -> case (discountFromDB customerID) of
               Just d -> d
               Nothing -> case (discountFromCache customerID) of
                          Just d -> d
                          Nothing -> 0.0

runTest :: String -> IO()
runTest customerID = do
    printf "%.2f\n" $ customerDiscount customerID
    -- printf "%.2f\n" $ customerDiscount2 customerID
    -- printf "%.2f\n" $ customerDiscount3 customerID
    -- printf "%.2f\n" $ customerDiscount4 customerID

main :: IO ()
main = do
    runTest "Net"
    runTest "DB"
    runTest "Cache"
    runTest "Foo"
