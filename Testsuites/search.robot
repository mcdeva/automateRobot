*** Settings ***
Resource    ../Resources/Keywords/search_keyword.resource


*** Test Cases ***
Search_001 Verify Search Robot Success
    [Documentation]    Owner : Rukpong
    Open Url Duckduckgo
    Input Text Search
    Enter On Text Search
    Verify First Link
    Take Screenshot

Debug 001
    [Tags]    debug
    Open Main Page
    Sleep    10s
