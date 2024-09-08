*** Settings ***
Library    Collections
Test Setup    Create Data For Tests

*** Keywords ***
Create Data For Tests
    @{names}=    Create List    Donal    Mickey    Goofy    Scrooge    Daisy
    Set Test Variable    ${names}
*** Test Cases ***
Put list in alphabetical order
    Sort List    ${names}
    Should Be Equal    ${names}[0]    Daisy
*** Test Cases ***
Remove names from the List
    Remove From List    ${names}    0
    Should Be Equal    ${names}[0]    Mickey