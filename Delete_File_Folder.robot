*** Settings ***
Library    OperatingSystem
*** Test Cases ***
Delete file and folder
    ${path}=    Set Variable    /Users/hieph/tmp/testfol/
    Remove File    ${path}test.txt
    Directory Should Be Empty    ${path}
    Remove Directory    ${path}