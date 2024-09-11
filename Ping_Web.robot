# My_Name: HIEP_HUYNH
*** Settings ***
Library    OperatingSystem
Library    String
Library    Collections

*** Test Cases ***
Get Ip address and ping time
    ${path}    Set Variable    /Users/hieph/RobotFramework/
    ${webPages}=    Get File    ${path}webpages.txt
    ${webAddress}=    Split String    ${webPages}
    ${length}=    Get Length    ${webAddress}
    # Create a file to store ip adress and ping-time:
    Create File    ${path}resulttest.txt

    FOR    ${i}    IN RANGE  ${length}
        ${items}=    Set Variable    ${webAddress}[${i}]
        ${getString}=    Run And Return Rc And Output    ping ${items} -c 4
        ${result}=    Split String    ${getString}[1]
        ${len}=    Get Length    ${result}
        ${index}=    Get Index From List    ${result}    from
        ${index}=    Evaluate    ${index}+1
        
    #Get Ip address and append to the file:
        ${ipAddress}=    Set Variable    ${result}[${index}]
        ${ipAddress}=    Remove String    ${ipAddress}    :
        Append To File    ${path}resulttest.txt    (${items})_ip_Adress: ${ipAddress}\n

    #Get Ping_time_1 and append to the file:
        ${index}=    Evaluate    ${index}+3
        ${pingTime1}=    Set Variable    ${result}[${index}]
        ${pingTime1}=    Remove String    ${pingTime1}    time=
        Append To File    ${path}resulttest.txt    Time: ${pingTime1}\n
    
    #Get Ping_time_2 and append to the file:
        ${index}=    Get Index From List    ${result}    from    ${index}
        ${index}=    Evaluate    ${index}+4
        ${pingTime2}=    Set Variable    ${result}[${index}]
        ${pingTime2}=    Remove String    ${pingTime2}    time=
        Append To File    ${path}resulttest.txt    Time: ${pingTime2}\n
    
    #Get Ping_time_3 and append to the file:
        ${index}=    Get Index From List    ${result}    from    ${index}
        ${index}=    Evaluate    ${index}+4
        ${pingTime3}=    Set Variable    ${result}[${index}]
        ${pingTime3}=    Remove String    ${pingTime3}    time=
        Append To File    ${path}resulttest.txt    Time: ${pingTime3}\n
    
    #Get Ping_time_4 and append to the file:
        ${index}=    Get Index From List    ${result}    from    ${index}
        ${index}=    Evaluate    ${index}+4
        ${pingTime4}=    Set Variable    ${result}[${index}]
        ${pingTime4}=    Remove String    ${pingTime4}    time=
        Append To File    ${path}resulttest.txt    Time: ${pingTime4}\n
    
    #Get Average_Ping_Time and append to the file:
        ${averageTime}    Evaluate   (${pingTime1}+${pingTime2}+${pingTime3}+${pingTime4})/4
        Append To File    ${path}resulttest.txt    Average Ping_Time: ${averageTime}\n\n
    
    # Test if the ping-time above is less than 50s:
        Should Be True    ${pingTime1}<50.0
        Should Be True    ${pingTime2}<50.0
        Should Be True    ${pingTime3}<50.0
        Should Be True    ${pingTime4}<50.0
    END