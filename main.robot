*** Settings ***
Library    Browser
Library    OperatingSystem
Library    String
Library    Collections
Library    RequestsLibrary

*** Variables ***
${api_path}    https://api.frankfurter.app/latest?from=EUR&to=USD
${url_path}    https://nbs.sk/en/statistics/exchange-rates/
${US_rate_NBS}    (//td[contains(text(), 'Us Dollar')]/following-sibling::td//span)[1]
${accept_cookie_button}    //button[contains(text(), 'Allow all')]

*** Keywords ***
Open Browser
    New Browser    chromium    headless=False
    New Context    acceptDownloads=True

Load the Page
    [Arguments]     ${path}
    New Page    ${path}

Get Rate From API
    Create Session    frankfurter    https://api.frankfurter.app
    ${response}=      GET On Session    frankfurter    /latest    params=from=EUR&to=USD
    
    ${json}=    Set Variable    ${response.json()}
    ${rate}=    Get From Dictionary    ${json['rates']}    USD
    RETURN      ${rate}

Get Rate from UI
    Open Browser
    Load the Page    path=${url_path}


    ${status}=    Run Keyword And Return Status    Wait for Elements State   ${accept_cookie_button}    timeout=10s 
    IF    ${status}
        Click    ${accept_cookie_button}
    END

    Wait for Elements State   ${US_rate_NBS}    timeout=5s 

    ${rate}=    Get Text    ${US_rate_NBS}
    RETURN     ${rate}

Compare Values With Tolerance
    [Arguments]    ${api_rate}    ${ui_rate}
    ${diff}=    Evaluate    abs(${api_rate} - ${ui_rate})
    
    # Ak je rozdiel väčší ako 0.5 USD, failneme test
    Should Be True    ${diff} < 0.5    msg=Rozdiel je príliš veľký! API: ${api_rate}, UI: ${ui_rate}
    
*** Test Cases ***
Test
    [Documentation]    Basic Api calls tests

    ${api_rate}=    Get Rate From API
    Log    Actual rate is : ${api_rate}
    ${ui_rate}=       Get Rate From UI
    Log    Actual rate from NBS: ${ui_rate}
    Compare Values With Tolerance    api_rate=${api_rate}    ui_rate=${ui_rate}