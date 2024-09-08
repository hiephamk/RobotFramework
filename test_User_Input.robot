*** Settings ***
Library    Dialogs

*** Test Cases ***
Ask User Input
    ${user}=    Get Value From User   pls input your text
    Should Be Equal    ${user}    Hello World
    Log    User enterd: ${user}