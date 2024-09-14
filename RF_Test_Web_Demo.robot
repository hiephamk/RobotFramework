*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${URL}    http://blazedemo.com/
${BROWSER}     Chrome
${options}    options=add_argument("--disable-search-engine-choice-screen");add_experimental_option("detach", True)

${cardMonth}    11
${cardYear}    2018
${tCost}    555

*** Test Cases ***
Assignment4_Test_website
    Open Browser    ${URL}    ${BROWSER}
    ...    options=add_argument("--disable-search-engine-choice-screen");add_experimental_option("detach", True)
    Sleep    2s
    # 2. Test that the page says "Welcome to the Simple Travel Agency!"
    Page Should Contain    Welcome to the Simple Travel Agency!
    # 3, 4, 5. Select "Boston" as departure and "Cairo" as the destination
    ${departure}=    Set Variable    Boston
    ${destination}=    Set Variable    Cairo
    Select From List By Value    xpath://select[@name='fromPort']    ${departure}
    Select From List By Value    xpath://select[@name='toPort']    ${destination}
    Log    ${departure}
    Log    ${destination}
    # 6. Check the Find Flights is selectable and click on it
    Click Button    css:input[type='submit']
    # 7. Check that the page says "Flights from ${departure} to ${destination}"
    Page Should Contain    Flights from ${departure} to ${destination}
    # 8. Check that you have at least one flight choice visible
    @{flights}=  Get WebElements    css:table[class='table']>tbody tr
    Log    ${flights}
    Should Not Be Empty     ${flights}
    # 9. Select one of the flights -> store the price, number and airline of that flight in separate variables
    ${price}=    Get Value  xpath://input[@name='price']
    ${number}=    Get Value  xpath://input[@name='flight']
    ${airline}=    Get Value  xpath://input[@name='airline']
    # 10. On the page that opens, check that the price, airline, and flight number of the trip you stored in the variables
    # can be found on the page
    Page Should Contain    ${price}
    Page Should Contain    ${number}
    Page Should Contain    ${airline}
    # 11. Store the total price of the flight in a new variable
    Click Button    css:input[value='Choose This Flight']
    Sleep    2s
    ${Total_Cost}=    Get Text  xpath://em
    # 11. Fill in the passenger information on the form (set the month and year of the card as global variables)
    Click Element    xpath://input[@name='inputName']
    Input Text    xpath://input[@name='inputName']    John

    Click Element    xpath://input[@name='address']
    Input Text    xpath://input[@name='address']    123 EinoKatu
    
    Click Element    xpath://input[@name='city']
    Input Text    xpath://input[@name='city']    Hameenlinna

    Click Element    xpath://input[@name='state']
    Input Text    xpath://input[@name='state']    Kata-Hame 

    Click Element    xpath://input[@name='zipCode']
    Input Text    xpath://input[@name='zipCode']    13200
    # 13. Choose Diner's Club as your credit card
    Click Element    xpath://select[@name='cardType']
    Select From List By Value    xpath://select[@name='cardType']    dinersclub

    Click Element    xpath://input[@name='creditCardNumber']
    Input Text    xpath://input[@name='creditCardNumber']    123456789
    
    Click Element    xpath://input[@name='creditCardMonth']
    Input Text    xpath://input[@name='creditCardMonth']    ${cardMonth}
    
    Click Element    xpath://input[@name='creditCardYear']
    Input Text    xpath://input[@name='creditCardYear']    ${cardYear}
    
    Click Element    xpath://input[@name='nameOnCard']
    Input Text    xpath://input[@name='nameOnCard']    John Smith
    # 14. Click "Remember me"
    Select Checkbox    xpath://input[@name='rememberMe']
    # 15. Click "Purchase Flight"
    Click Button    css:input[type='submit']
    Page Should Contain    Thank you for your purchase today!
    Table Row Should Contain    xpath://table[@class='table']    5    ${cardMonth} /${cardYear}
    Table Row Should Contain    xpath://table[@class='table']    3    ${tCost} USD
    Close Browser