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

Search_002 Verify More results Button Should Add More Results
    [Documentation]    Owner : Rukpong
    [Tags]    test
    Open Url Duckduckgo
    Input Text Search
    Enter on Text Search
    Wait First Link Visible
    # Scroll To More Results Button
    # Take Screenshot
    Click More Results Button
    Verify Number Page Results
    Take Screenshot