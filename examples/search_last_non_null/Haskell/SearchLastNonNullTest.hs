import Data.Maybe (fromMaybe)

data Customer = Customer {
    name :: String,
    address :: Maybe Address
} deriving Show

data Address = Address { 
    city :: Maybe String,
    country :: String 
} deriving Show

customerCitySize :: Customer -> Int
customerCitySize customer =
    let sizeMaybe = do
        address <- address customer        -- type Address
        city <- city address               -- type String
        return $ length city               -- type Maybe Int
    in fromMaybe 0 sizeMaybe
    
-- alternative 1: without do notation
customerCitySize_A1 :: Customer -> Int
customerCitySize_A1 customer =
    let addressMaybe = address customer    -- type Maybe Address
        cityMaybe = addressMaybe >>= city  -- type Maybe String
        sizeMaybe = length <$> cityMaybe   -- type Maybe Int
    in fromMaybe 0 sizeMaybe
    
-- alternative 2: single expression
customerCitySize_A2 :: Customer -> Int
customerCitySize_A2 customer =
    fromMaybe 0 $ length <$> (address customer >>= city)

-- alternative 3: simplified  do notation
customerCitySize_A3 :: Customer -> Int
customerCitySize_A3 customer =
    let sizeMaybe = do
        city <- (address customer) >>= city
        Just $ length city
    in fromMaybe 0 sizeMaybe
    
-- alternative 4: DOESN'T WORK !!!!!!!!!!!!!
-- hint: What's the difference of applying 'length' to "foo" or to Just "foo"?
customerCitySize_A4 :: Customer -> Int
customerCitySize_A4 customer =
    let c = address customer >>= city
        s = Just (length c)
    in fromMaybe 0 s

-- alternative 5: DOESN'T WORK !!!!!!!!!!!!!
-- hint: What's the type of cityMaybe?
customerCitySize_A5 :: Customer -> Int
customerCitySize_A5 customer =
    let addressMaybe = address customer
        cityMaybe = city <$> addressMaybe
        sizeMaybe = length <$> cityMaybe
    in fromMaybe 0 sizeMaybe
    
main :: IO ()
main = do

    -- city is defined
    let address1 = Address {city = Just "Orlando", country = "USA"}
    let customer1 = Customer {name = "Foo", address = Just address1}
    putStrLn $ show $ customerCitySize customer1
    putStrLn $ show $ customerCitySize_A1 customer1
    putStrLn $ show $ customerCitySize_A2 customer1
    putStrLn $ show $ customerCitySize_A3 customer1
    putStrLn $ show $ customerCitySize_A4 customer1
    putStrLn $ show $ customerCitySize_A5 customer1
    putStrLn " "

    -- city is not defined
    let address2 = Address {city = Nothing, country = "USA"}
    let customer2 = Customer {name = "Foo", address = Just address2}
    putStrLn $ show $ customerCitySize customer2
    putStrLn $ show $ customerCitySize_A1 customer2
    putStrLn $ show $ customerCitySize_A2 customer2
    putStrLn $ show $ customerCitySize_A3 customer2
    putStrLn $ show $ customerCitySize_A4 customer2
    putStrLn $ show $ customerCitySize_A5 customer2
    putStrLn " "

    -- address is not defined
    let customer3 = Customer {name = "Foo", address = Nothing}
    putStrLn $ show $ customerCitySize customer3
    putStrLn $ show $ customerCitySize_A1 customer3
    putStrLn $ show $ customerCitySize_A2 customer3
    putStrLn $ show $ customerCitySize_A3 customer3
    putStrLn $ show $ customerCitySize_A4 customer3
    putStrLn $ show $ customerCitySize_A5 customer3
