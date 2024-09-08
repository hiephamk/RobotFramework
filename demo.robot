*** Settings ***
Library    String

*** Variables ***
${one}    Donald
${two}    Duck
${three}


*** Test Cases ***
Check outcome
    ${three}=    Set Variable    Donald Duck
    Should Be Equal    ${one} ${two}   ${three}