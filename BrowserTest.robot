*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem

*** Variables ***
${PATH}           ${CURDIR}/example.txt
${EOF}            *****************End of File*********************

*** Test Cases ***
TC1
    [Setup]    Open Browser    https://www.google.com/    chrome    # setup to open browser
    Maximize Browser Window
    Input Text    name=q    Robot Framework
    Press Keys    name=q    RETURN
    ${Text1}=    Get Text    xpath://a[@href="https://robotframework.org/"]//following::div//child::cite
    Log    ${Text1}
    ${Text2}=    Get Text    xpath://a[@href="https://robotframework.org/"]//child::h3
    log    ${Text2}
    ${Text3}=    Get Text    //a[@href="https://github.com/robotframework/robotframework"]//following::div//child::cite
    Log    ${Text3}
    ${Text4}=    Get Text    //a[@href="https://github.com/robotframework/robotframework"]//child::h3
    Log    ${Text4}
    Create File    ${PATH}    ${Text1}\n    SYSTEM
    Append To File    ${PATH}    ${Text2}\n    SYSTEM
    Append To File    ${PATH}    ${Text3}\n    SYSTEM
    Append To File    ${PATH}    ${Text4}\n    SYSTEM
    Append To File    ${PATH}    ${EOF}    SYSTEM
    Log    ${EOF}
    Capture Page Screenshot    page.png
    [Teardown]    Close Browser    # teardown to close browser
