*** Settings ***
Library           RequestsLibrary


*** Variables ***
${BASE_URL}    http://localhost:5000

*** Keywords ***
Call API and Check Result
    [Arguments]    ${number}    ${expected_result}
    ${response}=    GET    ${BASE_URL}/is_prime/${number}

    Status Should Be    200

    ${result}=    Set Variable    ${response.json()["result"]}
    Should Be Equal  ${result}    ${expected_result}

*** Test Cases ***

Test when x is 17
    Call API and Check Result    17   ${True}

Test when x is 36
    Call API and Check Result    36   ${False}

Test when x is 13219
    Call API and Check Result    13219   ${True}
