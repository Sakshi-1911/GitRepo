*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem

*** Variables ***
${PATH}           ${CURDIR}/example.txt
${EOF}            *****************End of File*********************
@{LinkItems}

*** Test Cases ***
TC1
    Open Browser    https://www.google.com/    chrome
    Maximize Browser Window
    Input Text    name=q    Robot Framework
    Press Keys    name=q    RETURN
    @{LinkItems}    Create List
    Create File    ${PATH}    Script has printed first 4 results in this file\n    SYSTEM
    FOR    ${index}    IN RANGE    1    5
        ${LinkURL}=    Get Text    xpath:(//div[@lang="en"]//child::h3//parent::a) [${index}]
        ${LinkText}=    Get Text    xpath:(//div[@lang="en"]//child::h3)[${index}]
        Log    ${LinkURL}
        Log    ${LinkText}
        Append To File    ${PATH}    ${LinkURL}    SYSTEM
        Append To File    ${PATH}    ${LinkText}\n    SYSTEM
    END
    Capture Page Screenshot    page.png
    Close Browser
