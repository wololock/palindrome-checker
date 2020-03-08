import Lib
import Test.QuickCheck
import Test.QuickCheck.Instances
import Data.Char (isPunctuation)
import Data.Text as T

-- assert :: Bool -> String -> String -> IO ()
-- assert test passed failed = if test
--                             then putStrLn passed
--                             else putStrLn failed

-- main :: IO ()
-- main = do
--   putStrLn "Running tests..."
--   assert (isPalindrome "racecar") "passed 'racecar'" "FAIL: 'racecar'"
--   assert (isPalindrome "racecar!") "passed 'racecar!" "FAIL: 'racecar!'"
--   assert ((not . isPalindrome) "cat") "passed 'cat'" "FAIL: 'cat'"
--   assert (isPalindrome "racecar.") "passed 'racecar.'" "FAIL: 'racecar.'"
--   assert (isPalindrome ":racecar:") "passed ':racecar:" "FAILE: ':racecar:'"
--   putStrLn "done!"


prop_punctuation :: T.Text -> Bool
prop_punctuation text = preProcess text == preProcess noPuncText
  where noPuncText = T.filter (not . isPunctuation) text

main :: IO ()
main = do
  quickCheck prop_punctuation
  putStrLn "Done!"