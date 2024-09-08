*** Settings ***
Library    Collections
Library    ../.venv/lib/python3.12/site-packages/robot/libraries/OperatingSystem.py
*** Variables ***
@{list}    1    2    3    4

*** Test Cases ***
Add value to list
    @{list}=    Copy List    ${list}
    ${addition}=    Set Variable    333
    Append To List    ${list}    ${addition}
    Should Be Equal    ${list}[4]    333
*** Test Cases ***
List length
    ${length}=    Get Length    ${list}
    ${expected}=    Convert To Integer    4
    Should Be Equal    ${length}   ${expected}