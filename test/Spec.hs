import Lib

assert :: Bool -> String -> String -> IO ()
assert test passed failed = if test
                            then putStrLn passed
                            else putStrLn failed

main :: IO ()
main = do
  putStrLn "Running tests..."
  assert (isPalindrome "racecar") "passed 'racecar'" "FAIL: 'racecar'"
  assert (isPalindrome "racecar!") "passed 'racecar!" "FAIL: 'racecar!'"
  assert ((not . isPalindrome) "cat") "passed 'cat'" "FAIL: 'cat'"
  putStrLn "done!"
  