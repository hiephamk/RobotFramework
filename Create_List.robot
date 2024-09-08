*** Variables ***
@{list}    1    2    3    4    5

*** Test Cases ***
Check value from the list
    ${number}=    Set Variable    ${list}[2]
    Should Be Equal    ${number}    3