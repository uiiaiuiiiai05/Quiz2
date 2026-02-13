*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Browser To Risk Page
Test Teardown    Close Browser

*** Variables ***
${URL}        http://127.0.0.1:5500/risk.html
${BROWSER}    chrome

*** Keywords ***
Open Browser To Risk Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

*** Test Cases ***
TC01 GPAX มากกว่า 1.50 ต้องไม่เสี่ยง
    Select From List By Value    id=year    1
    Select From List By Value    id=term    2
    Input Text    id=gpax    2.00
    Click Button    id=evaluateBtn
    Page Should Contain    ไม่เสี่ยงรีไทร์

TC02 GPAX ต่ำกว่า 1.50 ต้องเสี่ยง
    Select From List By Value    id=year    1
    Select From List By Value    id=term    2
    Input Text    id=gpax    1.00
    Click Button    id=evaluateBtn
    Page Should Contain    เสี่ยงรีไทร์