*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary. This resource file is for testing purposes of Form.html and Complete.html
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        chrome
${DELAY}          0
${VALID FIRSTNAME}     Somsong
${VALID LASTNAME}    Sandee
${VALID DESTINATION}     Europe
${VALID CONTACTPERSON}    Sodsai Sandee
${VALID RELATIONSHIP}     Mother
${VALID EMAIL}    somsong@kkumail.com
${VALID PHONE}     081-111-1234
${CHROME_BROWSER_PATH}     E:/Test_WEB/chrome-win64/chrome-win64/chrome.exe
${CHROME_DRIVER_PATH}      E:/Test_WEB/chromedriver-win64/chromedriver-win64/chromedriver.exe
${FORM URL}       http://${SERVER}/Form.html
${COMPLETE URL}   http://${SERVER}/Complete.html

*** Keywords ***
Start Custom Chrome
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}   Set Variable    ${CHROME_BROWSER_PATH}
    ${service}     Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}

Open Browser to Form Page
    Start Custom Chrome
    Go To    ${FORM URL}  
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Input Firstname
    [Arguments]    ${firstname}
    Input Text    firstname    ${firstname}

Input Lastname
    [Arguments]    ${lastname}
    Input Text    lastname    ${lastname}

Input Destination
    [Arguments]    ${destination}
    Input Text    destination    ${destination}

Input ContactPerson
    [Arguments]    ${contactperson}
    Input Text    contactperson    ${contactperson}

Input Relationship
    [Arguments]    ${relationship}
    Input Text    relationship    ${relationship}

Input Email
    [Arguments]    ${email}
    Input Text    email    ${email}

Input Phone
    [Arguments]    ${phone}
    Input Text    phone    ${phone}

Click Submit Button
    Click Element    submitButton

Complete Page Should Be Open
    Location Should Be    ${COMPLETE URL}
    Title Should Be    Complete Page

Go To Form Page
    Go To    ${FORM URL}



