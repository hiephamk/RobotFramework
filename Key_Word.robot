*** Settings ***
Library    String
Library    OperatingSystem
Library    Collections
Library    ../.venv/lib/python3.12/site-packages/robot/libraries/Process.py
Library    ../.venv/lib/python3.12/site-packages/robot/libraries/Telnet.py
*** Keywords ***
Split text
    [Arguments]    ${text}
    @{list}=    Split String    ${text}
    ${word}=    Set Variable    ${list}[1]
    [Return]    ${word}
*** Test Cases ***
New test
    ${text}    Set Variable    Beautiful Shoes
    ${word}=    Split text    ${text}
    Should Be Equal    ${word}    Shoes
    Create File    /Users/hieph/tmp/testfol/word.txt    ${word}\n
*** Test Cases ***
Append test
    ${text}=    Set Variable    Hello Deer!
    ${word}=    Split text    ${text}
    Append To File    /Users/hieph/tmp/testfol/word.txt    ${word}\n
    Run    /Users/hieph/tmp/testfol/word.txt 