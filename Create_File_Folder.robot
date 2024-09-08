*** Settings ***
Library    OperatingSystem
*** Test Cases ***
Make new directory
    Create Directory    /Users/hieph/tmp/testfol
    Directory Should Exist    /Users/hieph/tmp/testfol
*** Test Cases ***
Make a new txt file
    ${path}=    Set Variable    /Users/hieph/tmp/testfol/
    Create File    ${path}test.txt    It wasn’t always easy,” said the freshly minted medical graduate of the Southwestern University PHINMA in Cebu, Philippines. “At 65 to 70 years old, my memory, eyesight, hearing and body are not as good as when I was younger.”