{-|
Petr Zapletal - forall implementation
I just changed Int to Integer, I think it is more general.
I also let testForall for possible result analysis

Examples:
forall (\ x -> odd x ) (\ x -> x == 5)
True

forall (\ x -> x <= 1000) (\ x -> even(x))
True

forall (\x -> mod x 3 == 0) (\ x -> x > 0)
False

testForall (\x -> mod x 3 == 0) (\ x -> x > 0 && x < 5)
[False,False,True,False]
-}

import Data.Bool
import Data.Typeable

instance (Typeable a, Typeable b) => Show (a -> b) where
    show f = "Function: " ++ (show $ typeOf f)

type Set = (Integer) => (Bool)

base :: [Integer]
base = [-1000 .. 1000]

forall :: (Integer -> Bool) -> Set -> Bool
forall p set = and $ map p $ filter set base
	
testForall :: (Integer -> Bool)	-> Set -> [Bool]
testForall p set = map p $ filter set base

-- Remarks:
-- GHCi, version 7.6.3: http://www.haskell.org/ghc/  :? for help

