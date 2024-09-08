*** Settings ***
Library    /Users/hieph/Library/CloudStorage/Dropbox/HIEP/EDUCATION/HAMK/2024/Software_Testing/Robot_Framework/MyLibrary.py
*** Test Cases ***
Get Max From List
    @{list}=    Create List    1    5    7
    ${value}=    Get Max From List    ${list}
    Should Be Equal    ${value}    7