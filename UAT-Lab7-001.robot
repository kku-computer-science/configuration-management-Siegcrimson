*** Settings ***
Documentation   A test suite settings with a single test for fill the information into the form 
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource_lab.robot

*** Test Cases ***
Test01 Open Form Test
    Open Browser to Form Page

Test02 Complete The Form
    Input Firstname    ${VALID FIRSTNAME}
    Input Lastname    ${VALID LASTNAME}
    Input Destination    ${VALID DESTINATION}
    Input ContactPerson    ${VALID CONTACTPERSON}
    Input Relationship    ${VALID RELATIONSHIP}
    Input Email    ${VALID EMAIL}
    Input Phone    ${VALID PHONE}
    Click Submit Button
    Complete Page Should Be Open