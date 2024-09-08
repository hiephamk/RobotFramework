*** Settings ***
Library    OperatingSystem
*** Test Cases ***
Ping web page and store the ping time
    ${output}=    Run And Return Rc And Output    ping www.microsoft.com -c 4
    Log    ${output}!