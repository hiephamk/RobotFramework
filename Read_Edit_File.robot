*** Settings ***
Library    String
Library    OperatingSystem
Library    Collections
Library    ../.venv/lib/python3.12/site-packages/robot/libraries/DateTime.py

*** Test Cases ***
Read text from file and create a words list
    ${path}=    Set Variable    /Users/hieph/tmp/testfol/test.txt
    ${output}=    Get File    ${path}
    ${output}=    Remove String    ${output}    .    ,
    @{wordList}=    Split String    ${output}
    ${index}=    Get Index From List    ${wordList}    University
    Log    ${index}
    ${place}=     Convert To Integer    13
    Should Be Equal    ${index}    ${place}