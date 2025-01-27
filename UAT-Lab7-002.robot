*** Settings ***
Documentation     A test suite containing tests related to incomplete filling the form
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser to Form Page
Suite Teardown    Close Browser
Test Setup        Go To Form Page
Test Template     Fill the Form with incomplete infomation
Resource          resource_lab.robot

*** Test Cases ***               FirstName        Lastname          Destination       ContactPerson        Relationship        Email        Phone

Empty Destination                ${VALID FIRSTNAME}    ${VALID LASTNAME}    ${EMPTY}    ${VALID CONTACTPERSON}    ${VALID RELATIONSHIP}    ${VALID EMAIL}    ${VALID PHONE}
Empty Email                      ${VALID FIRSTNAME}    ${VALID LASTNAME}    ${VALID DESTINATION}    ${VALID CONTACTPERSON}    ${VALID RELATIONSHIP}    ${EMPTY}    ${VALID PHONE}
Invalid Email                    ${VALID FIRSTNAME}    ${VALID LASTNAME}    ${VALID DESTINATION}    ${VALID CONTACTPERSON}    ${VALID RELATIONSHIP}    somsong@    ${VALID PHONE}
Empty Phone Number               ${VALID FIRSTNAME}    ${VALID LASTNAME}    ${VALID DESTINATION}    ${VALID CONTACTPERSON}    ${VALID RELATIONSHIP}    ${VALID EMAIL}    ${EMPTY}
Invalid Phone Number             ${VALID FIRSTNAME}    ${VALID LASTNAME}    ${VALID DESTINATION}    ${VALID CONTACTPERSON}    ${VALID RELATIONSHIP}    ${VALID EMAIL}    191

*** Keywords ***
Fill the Form with incomplete infomation
    [Arguments]    ${firstname}    ${lastname}    ${destination}    ${contactperson}    ${relationship}    ${email}    ${phone}
    Input Firstname    ${firstname}
    Input Lastname    ${lastname}
    Input Destination    ${destination}
    Input ContactPerson    ${contactperson}
    Input Relationship    ${relationship}
    Input Email    ${email}
    Input Phone    ${phone}
    Click Submit Button
    Capture Page Screenshot
    
